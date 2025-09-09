---
name: create-vision-prd
description: Guided workflow for creating lean, focused vision PRDs that prevent overengineering
specialization: Product vision definition, strategic clarity, anti-overengineering principles
triggers: ["vision prd", "product vision", "app strategy", "project foundation"]
---

# Vision PRD Creation Workflow

## Purpose
Create a concise, strategic Product Requirements Document that defines the app's core vision, target users, and key value propositions while explicitly preventing overengineering through focused scope definition.

<commentary>
A good vision PRD is like a north star - it guides all development decisions and prevents feature creep by clearly defining what the app IS and what it IS NOT.
</commentary>

## Guided PRD Creation Process (8-12 minutes)

### Step 1: Core Problem Definition (2-3 minutes)
```markdown
## Guided Questions:
1. **What specific problem does this app solve?**
   - Focus on ONE primary problem
   - Make it specific and measurable
   - Avoid generic statements like "improve productivity"

2. **Who exactly experiences this problem?**
   - Define 1-2 specific user personas
   - Include their context, frustrations, current solutions

3. **Why is this problem worth solving?**
   - Quantify the impact (time saved, money saved, frustration reduced)
   - Explain why existing solutions fall short

Example Output:
Problem: SwiftUI developers spend 40% of their debugging time on accessibility issues that could have been prevented during development.
Users: iOS developers building SwiftUI apps who care about inclusive design but lack systematic accessibility workflows.
Impact: Reduces accessibility debugging time by 70% while ensuring WCAG AA compliance from day one.
```

### Step 2: Vision Statement Creation (2-3 minutes)
```markdown
## Guided Questions:
1. **Complete this sentence: "This app helps [target users] to [achieve outcome] by [unique approach]"**

2. **What makes this different from existing solutions?**
   - Identify 1-2 unique differentiators
   - Avoid feature lists - focus on fundamental approach differences

3. **What would success look like in 6 months?**
   - Define 2-3 measurable success metrics
   - Include user behavior and business metrics

Example Output:
Vision: Pro-Vibe-Dev helps SwiftUI developers build accessible apps by embedding accessibility expertise directly into their AI-assisted development workflow.
Differentiator: First AI development system that makes accessibility a automatic, not an afterthought.
Success Metrics: 95% of components built are accessibility-compliant without rework, 50% reduction in time spent on accessibility fixes.
```

### Step 3: Strategic Scope Definition (3-4 minutes)
```markdown
## Core Value Features (Must-Have for MVP)
Guided Questions:
1. **What are the 3-5 features absolutely essential to solve the core problem?**
2. **If you could only build 3 things, what would they be?**
3. **What's the simplest version that provides real value?**

## Strategic Exclusions (Explicitly NOT included)
Guided Questions:
1. **What features would be nice-to-have but aren't essential?**
2. **What might users ask for that would actually dilute the core value?**
3. **What would you cut if you had half the time/resources?**

Example Output:
CORE VALUE FEATURES (MVP):
- Accessibility-first SwiftUI component templates
- Real-time VoiceOver compliance validation
- Junior-developer-friendly task breakdown system

STRATEGIC EXCLUSIONS (NOT in MVP):
- Advanced animation authoring tools (nice-to-have, not essential)
- Multi-platform support beyond iOS (dilutes focus)
- Visual design system editor (separate product category)
```

### Step 4: Anti-Overengineering Constraints (2-3 minutes)
```markdown
## Complexity Guardrails
1. **Time Boxing**: What's the maximum time investment for MVP? (Recommend 4-8 weeks)
2. **Feature Limit**: Maximum number of features in first release? (Recommend 5-7)
3. **User Journey Constraint**: Can the core value be delivered in under 3 user actions?

## Simplicity Tests
1. **Elevator Pitch Test**: Can you explain the app's value in 30 seconds?
2. **Decision Framework**: For any new feature idea, ask "Does this directly solve the core problem?"
3. **Complexity Budget**: Each feature must justify its complexity with proportional value

Example Output:
TIME BOX: 6 weeks maximum for MVP
FEATURE LIMIT: 5 core features maximum
USER JOURNEY: Users get value within 2 clicks from opening the app
DECISION FRAMEWORK: Any feature must reduce accessibility debugging time by at least 20%
```

## Vision PRD Template Output

### Auto-Generated Template Structure
```markdown
# [App Name] Vision PRD

*Created: [Date]*
*Time Investment: [Duration]*
*Strategic Review Date: [Date + 3 months]*

## Problem Statement
**Primary Problem**: [Specific, measurable problem]
**Target Users**: [1-2 specific personas with context]
**Problem Impact**: [Quantified pain points and current solutions' shortcomings]

## Vision & Strategy
**Vision Statement**: [One sentence: helps X achieve Y by Z]
**Unique Differentiator**: [What makes this fundamentally different]
**Success Metrics**: [2-3 measurable outcomes in 6 months]

## Strategic Scope

### Core Value Features (MVP)
1. **[Feature 1]** - [Why essential for core problem]
2. **[Feature 2]** - [Why essential for core problem]  
3. **[Feature 3]** - [Why essential for core problem]

### Strategic Exclusions (Explicitly NOT Included)
1. **[Excluded Feature 1]** - [Why not included, what it might lead to]
2. **[Excluded Feature 2]** - [Why not included, impact on focus]

## Anti-Overengineering Constraints
- **Time Box**: [Maximum MVP timeline]
- **Feature Limit**: [Maximum number of features]
- **Complexity Budget**: [Decision framework for new features]
- **User Journey Constraint**: [Maximum steps to core value]

## Success Criteria
- **User Behavior**: [How users will interact with the app]
- **Business Metrics**: [Usage, retention, or impact metrics]
- **Quality Standards**: [Non-negotiable quality thresholds]

## Next Steps
1. **Feature PRD Creation**: Break down core features into individual PRDs
2. **Technical Architecture**: Define system architecture supporting this vision
3. **Development Planning**: Create development sprints aligned with vision priorities
```

## Integration with Claude Code

### Usage Examples
```bash
# Create vision PRD with guided conversation
claude-code --task="Use pro-vibe-dev/workflows/create-vision-prd.md to create product vision for accessibility-focused SwiftUI development tool"

# Review and refine existing vision
claude-code --task="Use create-vision-prd.md to review and refine existing vision PRD for scope creep and strategic clarity"

# Validate feature against vision
claude-code --task="Use create-vision-prd.md to validate proposed feature X against established product vision and strategic scope"
```

### Quality Gates Integration
- **Strategic Alignment**: Every feature PRD must reference and align with vision PRD
- **Scope Validation**: Regular reviews against strategic exclusions list
- **Complexity Budget**: Feature complexity must justify value within established constraints
- **Success Tracking**: Regular measurement against defined success metrics

## Anti-Overengineering Principles

### Built-In Guardrails
1. **Time Boxing**: Forces prioritization and prevents endless feature addition
2. **Strategic Exclusions**: Proactively defines what NOT to build
3. **Simplicity Tests**: Regular validation against core value proposition
4. **Decision Framework**: Clear criteria for evaluating new feature requests

### Warning Signs to Watch For
- Vision statement becoming longer than 2 sentences
- Core features list growing beyond 5-7 items
- Strategic exclusions list getting shorter (scope creep indicator)
- Success metrics becoming more complex or numerous

<commentary>
The best vision PRDs are often the shortest ones. They say no to more things than they say yes to, and they make it impossible to justify building features that don't directly serve the core value proposition.
</commentary>

## Continuous Vision Alignment

### Regular Review Cycles
- **Monthly Vision Check**: Are development activities aligned with vision?
- **Quarterly Strategy Review**: Should vision evolve based on learnings?
- **Feature Evaluation**: Does each new feature idea support or dilute the vision?

### Evolution Guidelines
- Vision should be stable but not rigid
- Changes require explicit reasoning and impact assessment  
- Maintain focus on core problem while allowing tactical flexibility
- Document vision evolution for team alignment

This workflow ensures your product vision remains focused, actionable, and aligned with anti-overengineering principles while providing clear strategic direction for all development activities.