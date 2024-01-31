#!/bin/bash

# Set the GitLab server URL, group name, and access token
GITLAB_SERVER="GITLAB_SERVER"
GROUP_NAME="GROUP_NAME"
ACCESS_TOKEN="ACCESS_TOKEN"

# Function to clone repositories from a group
clone_repositories() {
  # Construct the GitLab API URL to fetch projects
  local api_url="$GITLAB_SERVER/api/v4/projects?per_page=200"
  
  # Fetch the list of projects in JSON format using cURL and remove spaces
  local projects_json
  projects_json=$(curl --header "PRIVATE-TOKEN:$ACCESS_TOKEN" "$api_url" | tr -d '[:space:]')
  
  # Print the fetched JSON data (for debugging purposes)
  echo "$projects_json"
  
  # Iterate over each project in the JSON array
  for project_json in $(echo -E "$projects_json" | jq -c '.[]'); do
    local path_with_namespace
    local repo_url
    
    # Extract project details from JSON
    path_with_namespace=$(echo "$project_json" | jq -r '.path_with_namespace')
    repo_url=$(echo "$project_json" | jq -r '.http_url_to_repo')
    
    # Create directory structure based on project's path with namespace
    mkdir -p "$path_with_namespace"
    
    # Clone the Git repository into the created directory
    git clone $repo_url "$path_with_namespace"
  done
}

# Start cloning repositories in the specified group
clone_repositories
