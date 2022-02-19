### How to upload artifact APK into Slack
```yaml
- name: Slack File Upload
  uses: adrey/slack-file-upload-action@1.0.5
  with:
    # Path to file
    path: app/build/outputs/apk/debug/app-debug.apk
    # Slack token
    token: #how-to-get-token part
    # Slack channels
    channel: #channel name. for eg:github_action_ci
    # Filename of file
    filename: app-debug.apk
    # A file type identifier.
    filetype: apk
    # The message text introducing the file in specified channels.
    initial_comment: Download new debug build APK
    # Title of file
    title: New build from Github Actions
```

- how-to-get-token:
1. Go to Slack
2. Create an app. for eg: `Github CI app`
3. In `OAuth & Permissions` > `OAuth Tokens for Your Workspace` > Install app to workspace (Add file:write permission) > Copy generated `Bot User OAuth Token` then fill to `token:` in yaml CI file
4. Go to Slack, create a channel, for eg: `github_action_ci`. Then fill to `channel:` in yaml CI file
5. In `github_action_ci` channel on Slack, type `/invite Github CI app`
