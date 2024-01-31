# GitLab Repositories Cloner

This script automates the process of cloning all repositories from a specified GitLab group, while preserving the group and sub-group structure. It is designed to work seamlessly with both self-hosted and GitLab instances.

## Features

- Clones all repositories within a specified GitLab group.
- Maintains the group and sub-group structure during cloning.
- Works with both self-hosted and GitLab instances.

## Usage

1. Set the configuration parameters in the script (`GITLAB_SERVER`, `GROUP_NAME`, `ACCESS_TOKEN`).
2. Run the script in a Zsh environment.

```bash
./script.sh
```

## Dependencies

The following dependencies are required to run the script:

- **cURL**: Command-line tool for making HTTP requests.
- **jq**: Lightweight and flexible command-line JSON processor.

Make sure these dependencies are installed before running the script.
