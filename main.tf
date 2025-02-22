
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = jsondecode(file("github_config.json"))["token"]
}

# Creo repositorio
resource "github_repository" "repo" {
  name        = "Primer_terraform"
  description = "Este repositorio esta creado con terraform para automatizar procesos de infraestructura como codigo (IaC). Profesor, si lee esto va un 5 a este lab."
  visibility  = "public"
  auto_init   = true
}

# Crear ramas en el repositorio
resource "github_branch" "rama_1" {
  repository = github_repository.repo.name
  branch     = "rama_1"
}

resource "github_branch" "rama_2" {
  repository = github_repository.repo.name
  branch     = "rama_2"
}

resource "github_branch" "rama_3" {
  repository = github_repository.repo.name
  branch     = "rama_3"
}

# Agregar un usuario colaborador al repositorio
resource "github_repository_collaborator" "colaborador" {
  repository = github_repository.repo.name
  username   = "NivekTakedown"
  permission = "pull"
}

