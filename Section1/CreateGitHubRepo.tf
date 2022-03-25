terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "4.3.2"
    }
  }
}

provider "github" {
  token = "YOUR-GITHUB-TOKEN"
}

resource "github_repository" "myRepo" {
  name        = "terraform-repo"

  visibility  = "private"

}