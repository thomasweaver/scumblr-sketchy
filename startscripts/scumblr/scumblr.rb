#     Copyright 2014 Netflix, Inc.
#
#     Licensed under the Apache License, Version 2.0 (the "License");
#     you may not use this file except in compliance with the License.
#     You may obtain a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#     Unless required by applicable law or agreed to in writing, software
#     distributed under the License is distributed on an "AS IS" BASIS,
#     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#     See the License for the specific language governing permissions and
#     limitations under the License.


Scumblr::Application.configure do
  # Should Scumblr automatically generate screenshots for new results
  config.sketchy_url = "http://sketchy:8000/api/v1.0/capture"
  # config.sketchy_use_ssl = false  # Does sketchy use ssl?
  # config.sketchy_verify_ssl = true # Should scumblr verify sketchy's cert
  # config.sketchy_tag_status_code = true # Add a tag indicating last status code sketchy received
  # config.sketchy_access_token = "" # Access token for sketchy

  # Provider configurations

  #config.ebay_access_key = ''

  #config.facebook_app_id = ''
  #config.facebook_app_secret = ''

  config.google_developer_key = ''
  config.google_cx  = ''
  config.google_application_name = 'scumblr'
  config.google_application_version = '1.0'

  #config.youtube_developer_key = ''
  #config.youtube_application_name = ''
  #config.youtube_application_version = ''

  #config.twitter_consumer_key        = ''
  #config.twitter_consumer_secret     = ''
  #config.twitter_access_token        = ''
  #config.twitter_access_token_secret = ''


end
