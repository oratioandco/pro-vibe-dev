---
name: new-feature
description: Guides the development of a new feature from idea to task execution, integrating PM, Tech, and UX perspectives.
specialization: Feature development, scope management, cross-functional collaboration, automated documentation
triggers: ["add new feature", "develop feature", "implement new functionality"]
---

# New Feature Development Workflow

## Purpose
To provide a structured and guided process for developing new features, ensuring alignment with product vision, technical feasibility, and user experience best practices, while automatically updating project documentation.

## Step-by-Step Feature Development Process

### Phase 1: Feature Idea & Initial Dialogue

```markdown
## 1.1 Capture Feature Idea
**User Input Required**: 
"What new feature would you like to develop? Please provide a high-level description."
- **Feature Idea**: [e.g., "User messaging system", "Dark mode support"]

## 1.2 Clarifying Questions
**Automatic Action**:
- Ask clarifying questions to better understand the feature's core purpose, target users, and desired outcomes.

**User Checkpoint**:
"To help me understand the feature better, please answer the following questions:
- What problem does this feature solve for the user?
- Who are the primary users of this feature?
- What is the main goal or desired outcome of this feature?"
```

### Phase 2: Product Management (PM) Consultation

```markdown
## 2.1 Scope Minimization & Alternatives
**Activated Agent**: Vision Strategist (PM Agent)

**Automatic Action**:
- The Vision Strategist will analyze the feature idea, suggest ways to minimize scope, and propose alternative solutions that might achieve similar value with less effort.

**User Checkpoint**:
"Based on the feature idea, the Product Management perspective suggests:
- **Core Value**: [Identified core value]
- **Scope Minimization**: [Suggestions to reduce scope]
- **Alternative Solutions**: [Alternative approaches]

Do you approve the refined scope and core value, or would you like to explore alternatives? (approve/explore/revise)"
```

### Phase 3: Technical (Tech) Consultation

```markdown
## 3.1 Technical Feasibility & Architecture
**Activated Agents**: Relevant Tech Agents (e.g., Backend Agent, UI Frontend Agent)

**Automatic Action**:
- Tech Agents will assess the technical feasibility of the feature, identify potential architectural impacts, and suggest efficient implementation paths.

**User Checkpoint**:
"From a Technical perspective, here are the considerations:
- **Feasibility**: [Assessment of technical feasibility]
- **Architectural Impact**: [Potential changes to existing architecture]
- **Implementation Approach**: [Suggested technical approach]

Do you approve the technical approach? (approve/revise)"
```

### Phase 4: User Experience (UX) Consultation

```markdown
## 4.1 UX Guidelines & Review
**Activated Agent**: UX Designer (new agent) + Accessibility Expert

**Automatic Action**:
- The UX Designer and Accessibility Expert will review the feature from a user perspective, provide crucial UX guidelines, and identify potential usability or accessibility issues.

**User Checkpoint**:
"From a User Experience perspective, here are the guidelines and considerations:
- **Key UX Principles**: [Relevant UX principles]
- **Usability Considerations**: [Potential usability issues]
- **Accessibility Impact**: [Accessibility considerations]

Do you approve the UX guidelines and considerations? (approve/revise)"
```

### Phase 5: Vision Appending & Task Generation

```markdown
## 5.1 Append Vision & Generate Tasks
**Automatic Action**:
- The new feature's vision will be appended to the main project vision document (e.g., `docs/prd.md`).
- The `create-tasks.md` workflow will be invoked to break down the feature into junior-developer-ready tasks, incorporating PM, Tech, and UX guidelines.
- The `current-sprint.md` will be updated with the new tasks.

**User Checkpoint**:
"The feature vision has been appended, and tasks have been generated and added to your current sprint. Review the generated tasks? (y/n)"
```

### Phase 6: Automated Feature/System Overview Update

```markdown
## 6.1 Update Feature Overview
**Automatic Action**:
- The `pro-vibe-dev/docs/feature-overview.md` document will be automatically updated with the new feature details, ensuring an always up-to-date system overview.

**User Checkpoint**:
"The feature overview document has been updated. Review the updated overview? (y/n)"
```

## Usage Example

```bash
claude-code --task="Use pro-vibe-dev/workflows/new-feature.md to add new feature"
```
