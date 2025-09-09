---
name: project-setup
description: Initializes a new project with user-defined tech stack, best-practice research, and git integration.
specialization: Project scaffolding, tech stack selection, best-practice research, git workflow
triggers: ["new project", "start project", "setup project", "initialize project"]
---

# Project Setup Workflow

## Purpose
To create a new, well-structured project based on user-defined technology choices, incorporating industry best practices and setting up a professional Git workflow from the start.

## Step-by-Step Setup Process

### Phase 1: Project Definition and Technology Stack Consultation

```markdown
## 1.1 Define Project Core Details
**User Input Required**: 
"I'm ready to set up a new project. Please provide the following details:"
- **Project Name**: [e.g., "PhotoVibe", "TaskMaster"]
- **Project Type**: [e.g., "iOS App", "macOS App", "Universal App", "Web App", "Backend Service"]
- **Brief Description**: [A one-sentence summary of the app's purpose]

## 1.2 Technology Stack Consultation
**Automatic Action**:
- Based on your project description, I will research and recommend a few technology stacks that are stable, future-proof, cost-efficient, and GDPR-compliant.

**Example Research Queries**:
- "best open source stack for [Project Type] 2025"
- "GDPR compliant hosting solutions in Germany"
- "stable and future-proof database for [Project Type]"

**User Checkpoint**:
"Based on my research, here are a few recommended technology stacks for your project:

**Option 1: [Stack Name]**
- **Pros**: [e.g., "Excellent performance", "Large community", "Free and open source"]
- **Cons**: [e.g., "Steeper learning curve"]

**Option 2: [Stack Name]**
- **Pros**: [e.g., "Easy to learn", "Rapid development"]
- **Cons**: [e.g., "Potential for vendor lock-in"]

**Option 3: Other**
- You can also specify your own technology stack.

Please choose an option or specify your own stack:
- **Primary Language/Framework**: [e.g., "SwiftUI", "React", "Node.js", "Python"]
- **UI Framework/Library (if applicable)**: [e.g., "Shadcn", "Tailwind CSS", "Material-UI"]
- **Database (if applicable)**: [e.g., "Core Data", "SwiftData", "Firebase", "PostgreSQL"]
- **Key Libraries/Dependencies**: [e.g., "Alamofire", "Kingfisher", "Redux"]
```

### Phase 2: Best-Practice Application and Configuration

```markdown
## 2.1 Apply Best Practices
**Automatic Action**:
- Check if a pre-configured best-practice file exists for the selected `Primary Language/Framework` in `pro-vibe-dev/knowledge-base/best-practices/`.

IF pre-configured_file_exists:
    - **Action**: Load best practices from `pro-vibe-dev/knowledge-base/best-practices/[Primary Language/Framework].md`.
    - **Output**: "Using pre-configured best practices for [Primary Language/Framework]."
ELSE:
    - **Action**: Perform a web search for current best practices for the selected technology stack.
    - **Example Search Query**: "best practices for [Primary Language/Framework] [Project Type] with [UI Framework/Library] and [Database] 2025"
    - **Output**: A summary of the findings will be saved to `docs/research/tech-stack-best-practices.md`.
    - **Action**: Invoke the `best-practice-analyzer.md` agent to analyze the research and apply the best practices to the project configuration.

## 2.2 Configure Project and Agents
**Automatic Action**:
- The system and agent configurations will be updated based on the applied best practices.
- **`generic-config.json`**: Updated with project-specific settings.
- **Agent Personas (`*.md`)**: Updated with relevant best practices and coding patterns.
- **Example Update to `ui-frontend.md`**: "When building SwiftUI views, always use `@State` for transient UI state and `@StateObject` for view models. Ensure all views are embeddable in a `UIHostingController` for potential UIKit integration."
```

### Phase 3: Project Scaffolding and Git Integration

```markdown
## 3.1 Create Project Structure
**Automatic Action**:
- A directory structure will be created based on the project type and technology stack.
- **Example for SwiftUI App**:
  - `PhotoVibe/`
    - `PhotoVibe/` (App, Content)
    - `PhotoVibe/Views/`
    - `PhotoVibe/ViewModels/`
    - `PhotoVibe/Models/`
    - `PhotoVibe/Services/`
    - `PhotoVibeTests/`
    - `PhotoVibeUITests/`

## 3.2 Initialize Git and Create `develop` Branch
**Automatic Action**:
- A new Git repository will be initialized.
- An initial commit will be made with the generated project structure.
- A `develop` branch will be created and checked out.

**User Checkpoint**:
"A new Git repository has been initialized and you are now on the `develop` branch. I will now create a new branch for our work on the new feature. What should be the name of the new branch?"
- **User Input**: [e.g., "feature/initial-setup", "feat/project-init"]
```

### Phase 4: Finalization

```markdown
## 4.1 Summary and Next Steps
**Automatic Action**:
- A summary of the project setup will be displayed.
- The `README.md` file will be updated with the project details.
- The `current-sprint.md` will be populated with initial tasks based on the project type.

**User Checkpoint**:
"Your new project, **[Project Name]**, is ready to go!

- **Technology Stack**: [Summary of tech stack]
- **Best Practices**: Summarized in `docs/research/tech-stack-best-practices.md`
- **Git**: You are on the `[feature-branch-name]` branch.

Ready to create the product vision for your new project? (y/n)"
```

## Usage Example

```bash
claude-code --task="Use project-setup.md to start a new project"
```
