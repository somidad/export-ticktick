# Ticktick Exporter

## Usage

- Download and execute `export-ticktick`
- When a prompt `Enter code:` appears, visit [here](https://ticktick.com/oauth/authorize?scope=tasks:read&client_id=L3kCTCHx8Nyw982O4x&response_type=code) to authorize this app
- When a code appears, enter it to the prompt
- Select a list to export and wait for the app to finish

## Limitations

- Exporting Inbox is not supported
- A filename for a task/note is its `id` instead of its title
  - The title is written in the first level 1 heading of the exported file
- A foldername for a list is its `id` instead of its title
  - The title is written in `.metadata` under the exported folder
- Attachments are not downloaded
