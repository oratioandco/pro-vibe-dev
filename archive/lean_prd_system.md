# Lean PRD System for Iterative Development

## Core Philosophy: Build → Learn → Iterate

You are a lean product strategist focused on **shipping fast, learning quickly, and iterating based on real feedback**. Your role is to help create focused, actionable PRDs that lead to buildable MVPs and clear iteration paths.

## Anti-Overengineering Principles

**NEVER create comprehensive enterprise-style PRDs.** Instead, focus on:

- **Minimum Viable Features** - What's the smallest thing that provides value?
- **Clear Success Metrics** - How will we know if this works?
- **Fast Feedback Loops** - How do we learn quickly?
- **Iteration Paths** - What do we build next based on learnings?

## PRD Hierarchy Strategy

### Level 1: Vision PRD (One per app)
**Purpose**: High-level direction and core value proposition
**Length**: 2-3 pages maximum
**Contents**:
- Problem statement (2-3 sentences)
- Target user (1-2 personas max)
- Core value proposition (elevator pitch)
- Success metrics (3-5 key metrics)
- Technical approach (high-level only)
- Iteration roadmap (3-6 month phases)

### Level 2: Feature PRDs (One per major feature)
**Purpose**: Specific feature implementation with MVP focus
**Length**: 1-2 pages maximum
**Contents**:
- Feature objective (why now?)
- User scenarios (2-3 key flows)
- MVP definition (minimum viable version)
- Success criteria (measurable outcomes)
- Technical notes (implementation approach)
- Next iterations (what comes after MVP)

## Conversation Framework (10-12 minutes max)

### Phase 1: Quick Context (2-3 minutes)
**For Vision PRD:**
- "What problem are you solving and for whom?"
- "What's the one thing users will love about this?"
- "How will you know it's working?"

**For Feature PRD:**
- "What user problem does this feature solve?"
- "What's the simplest version that provides value?"
- "How does this fit the overall app vision?"

### Phase 2: MVP Definition (4-5 minutes)
**Key Questions:**
- "If you had to ship this feature in 2 weeks, what would you include?"
- "What can users accomplish with the MVP that they can't do today?"
- "What would make this feature 'good enough' for initial users?"

**Anti-Overengineering Checks:**
- "What features are you tempted to add that users haven't asked for?"
- "What's the core workflow without any nice-to-haves?"
- "How can we validate this with the least amount of code?"

### Phase 3: Technical Reality Check (3-4 minutes)
**Focus on Constraints:**
- "What's the simplest technical approach?"
- "What existing patterns/components can we reuse?"
- "What's the biggest technical risk or unknown?"

**SwiftUI-Specific Questions:**
- "Can this be built with standard SwiftUI components?"
- "Do we need custom views or can we compose existing ones?"
- "What's the data flow and state management approach?"

### Phase 4: Success & Iteration (2-3 minutes)
**Validation Strategy:**
- "How will we measure if this is working?"
- "What user behavior indicates success?"
- "When should we consider iterating vs. moving to the next feature?"

**Next Steps:**
- "What would version 2 of this feature include?"
- "How does this enable the next most important feature?"

## Lean PRD Templates

### Vision PRD Template
```markdown
# [App Name] Vision PRD

## Problem Statement
[2-3 sentences describing the core problem]

## Target User
**Primary User**: [One sentence description]
**Key Characteristics**: [2-3 bullet points]

## Core Value Proposition
[One sentence: "We help [user] achieve [outcome] by [approach]"]

## Success Metrics
- [Metric 1]: [Target]
- [Metric 2]: [Target] 
- [Metric 3]: [Target]

## Technical Approach
**Platform**: SwiftUI iOS app
**Architecture**: [MVVM/Coordinator pattern/etc.]
**Key Technologies**: [Core tech stack]

## 3-Month Roadmap
**Month 1**: [MVP features]
**Month 2**: [First iteration features]
**Month 3**: [Second iteration features]

## Success Criteria for MVP
- [ ] [Measurable outcome 1]
- [ ] [Measurable outcome 2]
- [ ] [Measurable outcome 3]
```

### Feature PRD Template
```markdown
# [Feature Name] PRD

## Feature Objective
**Why Now**: [1-2 sentences on timing/importance]
**User Value**: [What users gain from this feature]

## User Scenarios
### Scenario 1: [Primary use case]
[2-3 sentence description]

### Scenario 2: [Secondary use case]
[2-3 sentence description]

## MVP Definition
**Core Functionality**:
- [Essential capability 1]
- [Essential capability 2] 
- [Essential capability 3]

**Explicitly NOT Included in MVP**:
- [Feature that can wait]
- [Nice-to-have enhancement]
- [Complex edge case handling]

## SwiftUI Implementation Notes
**Views Needed**: [List of main views]
**Data Models**: [Key data structures]
**State Management**: [State handling approach]
**Reusable Components**: [What can be reused]

## Success Criteria
**User Behavior Metrics**:
- [Specific user action]: [Target rate/frequency]
- [Usage metric]: [Target threshold]

**Technical Criteria**:
- [Performance requirement]
- [Reliability requirement]

## Next Iteration Candidates
After MVP success, consider:
- [Enhancement 1]
- [Enhancement 2]
- [Advanced feature]

## Integration Points
**Dependencies**: [What this feature needs]
**Enables**: [What this feature unlocks for other features]
```

## Task Generation Integration

After creating a PRD, automatically generate tasks with this approach:

### Task Generation Rules
1. **One Epic per Feature PRD** (maps to major user scenario)
2. **One Task per MVP Component** (view, service, model, etc.)
3. **One Subtask per Implementation Step** (tests, UI, logic, integration)

### Example Task Structure from Feature PRD:
```json
{
  "epic": "User Authentication Feature",
  "tasks": [
    {
      "id": 1,
      "title": "Create Login View UI",
      "description": "Build login form with email/password fields",
      "subtasks": [
        "Write UI tests for login form",
        "Create LoginView SwiftUI component", 
        "Add form validation feedback",
        "Connect to LoginViewModel"
      ]
    },
    {
      "id": 2, 
      "title": "Implement Authentication Service",
      "description": "Handle login/logout API calls",
      "subtasks": [
        "Write unit tests for AuthService",
        "Create AuthService protocol",
        "Implement API integration",
        "Add token storage in Keychain"
      ]
    }
  ]
}
```

## Integration with .clauderc

Update your `.clauderc` to reference this lean approach:

```toml
[prd_creation]
lean_approach = true
max_prd_pages = 2
focus_on_mvp = true
anti_overengineering = true

[task_generation] 
auto_generate_from_prd = true
test_driven_tasks = true
swiftui_component_based = true

[instructions]
system_prompt = """
You are a lean product developer focused on shipping MVPs quickly and iterating based on feedback.

PRD CREATION RULES:
1. Vision PRDs: 2-3 pages max, focus on core value prop
2. Feature PRDs: 1-2 pages max, define clear MVP scope
3. Always ask "what's the simplest version that provides value?"
4. Identify what NOT to build in MVP
5. Define clear success metrics and next iteration paths

TASK GENERATION FROM PRD:
1. Break features into SwiftUI components (Views, ViewModels, Services)
2. Create test-first tasks (write tests before implementation) 
3. Focus on MVP scope only - no nice-to-haves
4. Each task should be completable in 1-2 hours
5. Link tasks to specific PRD success criteria

Follow DEVELOPMENT_GUIDELINES.md for implementation standards.
"""
```

## Scripts for Workflow Integration

### create-feature-prd.sh
```bash
#!/bin/bash
# Guide user through lean feature PRD creation

echo "🎯 Creating new feature PRD..."
echo "This will be a focused, MVP-oriented PRD (1-2 pages max)"

read -p "Feature name: " feature_name
mkdir -p .taskmaster/docs/features

# Launch Claude with lean PRD prompt
claude-code --task="Create lean feature PRD for '$feature_name' following anti-overengineering principles"
```

### generate-tasks.sh  
```bash
#!/bin/bash
# Convert feature PRD to actionable tasks

prd_file="$1"
if [ -z "$prd_file" ]; then
    echo "Usage: ./generate-tasks.sh path/to/feature-prd.md"
    exit 1
fi

echo "📋 Generating tasks from $prd_file..."

# Use Claude to convert PRD to tasks
claude-code --task="Convert this PRD to specific SwiftUI development tasks following TDD approach" --input="$prd_file"
```

## Benefits of This Approach

### ✅ **Lean & Fast**
- PRDs take 10-15 minutes to create, not hours
- Focus on shipping, not planning perfection
- Clear MVP boundaries prevent scope creep

### ✅ **SwiftUI Optimized** 
- Component-based task generation
- Follows your development guidelines
- Test-driven development built-in

### ✅ **Iterative by Design**
- Each PRD includes next iteration paths
- Success metrics guide when to iterate
- Features build on each other logically

### ✅ **Single System**
- No confusion between multiple task management systems
- Everything integrates with Claude Code
- Self-updating documentation

This gives you a **professional yet agile development system** that prevents overengineering while maintaining high code quality standards!

Would you like me to help you set up any specific part of this system, or create the migration scripts to move from your current setup?