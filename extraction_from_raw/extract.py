import os
import json

import pandas as pd
import user_agents

DATA_DIR = 'raw_all'

participants = []

df_dict_list_validation = []

for filename in os.listdir(DATA_DIR):
    if not filename.endswith('.json'):
        continue

    with open(os.path.join(DATA_DIR, filename)) as f:
        data = json.load(f)

    df_dict = dict()
    df_dict['subid'] = filename[:-12]

    user_agent = user_agents.parse(data[1]['userAgent'])

    df_dict['browser_family'] = user_agent.browser.family
    df_dict['browser_version'] = user_agent.browser.version_string

    if user_agent.os.family == 'Windows' or user_agent.os.family == 'Android':
        os_tag = f'{user_agent.os.family} {user_agent.os.version_string}'
    elif user_agent.os.family == 'Mac OS X':
        if user_agent.os.version_string.startswith('10.15'):
            os_tag = 'macOS Catalina'
        elif user_agent.os.version_string.startswith('10.14'):
            os_tag = 'macOS Mojave'
        elif user_agent.os.version_string.startswith('10.13'):
            os_tag = 'macOS High Sierra'
        elif user_agent.os.version_string.startswith('10.12'):
            os_tag = 'macOS Sierra'
        elif user_agent.os.version_string.startswith('10.11'):
            os_tag = 'macOS El Capitan'
        else:
            os_tag = 'macOS'
    else:
        os_tag = user_agent.os.family

    df_dict['os_name_for_study'] = os_tag
    df_dict['os_family'] = user_agent.os.family
    df_dict['os_version'] = user_agent.os.version_string

    df_dict['device_family'] = user_agent.device.family

    # a hacky addition to allow for simple analysis of jspsych webgazer validation trials

    data_validation = [x for x in data if 'trial_type' in x and x['trial_type'] == 'webgazer-validate']
    # hacky way to get the window height and width, as the validation data does not contain that information
    first_trial = [x for x in data if 'task' in x and x['task'] == 'video'][0]

    df_dict['window_width'] = first_trial["windowWidth"]  # assumes width stays constant across trials
    df_dict['window_height'] = first_trial["windowHeight"]  # assumes height stays constant across trials

    # harcoded for now, as this is not present in the data
    df_dict['roi_radius'] = 200

    # We know that there were only 2 validatin trials
    for index, validation_trial in enumerate(data_validation):

        df_dict[f'avg_offset_x_{index}'] = validation_trial['average_offset'][0]['x']
        df_dict[f'avg_offset_y_{index}'] = validation_trial['average_offset'][0]['y']
        df_dict[f'mean_distance_{index}'] = validation_trial['average_offset'][0]['r']
        df_dict[f'avg_offset_x_percent_{index}'] = df_dict[f'avg_offset_x_{index}'] / df_dict['window_width'] * 100
        df_dict[f'avg_offset_y_percent_{index}'] = df_dict[f'avg_offset_y_{index}'] / df_dict['window_height'] * 100
        df_dict[f'gaze_percent_in_roi_{index}'] = validation_trial['percent_in_roi'][0]

    df_dict_list_validation.append(dict(df_dict))


data_validation = pd.DataFrame(df_dict_list_validation)\
            .sort_values(['subid'])\
            .reset_index(drop=True)

data_validation.to_csv(f'data_validation_useragent.csv', encoding='utf-8', index=False)
