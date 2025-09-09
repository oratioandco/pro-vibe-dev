# Pro-Vibe-Dev Example Workflow: Building a Habit Tracking App

This example demonstrates the complete Pro-Vibe-Dev workflow from vision to working, tested code.

## Phase 1: Strategic Vision (8-12 minutes)

### Creating the Vision PRD
```bash
claude-code --task="Use pro-vibe-dev/workflows/create-vision-prd.md to create vision for SwiftUI habit tracking app"
```

**Guided Conversation Flow**:
```
🤖: Let's create a focused vision for your habit tracking app. First, what specific problem does this solve?

👤: People struggle to build consistent habits because they lose motivation after a few days.

🤖: Who exactly experiences this problem? Be specific about your target users.

👤: iOS users who want to build healthy habits like exercise, meditation, or reading, typically ages 25-40, tech-savvy but busy.

🤖: What makes your approach different from existing habit trackers?

👤: Instead of complex features, just simple daily check-ins with visual progress that motivates through simplicity.

[Continues for 8-12 minutes...]
```

**Generated Vision PRD Output**:
```markdown
# HabitFlow Vision PRD

## Problem Statement
**Primary Problem**: 73% of habit tracking app users abandon within 7 days due to overwhelming features and complexity
**Target Users**: Busy iOS professionals (25-40) who want to build 1-3 key habits without complexity
**Problem Impact**: Failed habit formation leads to decreased wellbeing and productivity

## Vision & Strategy
**Vision Statement**: HabitFlow helps busy professionals build lasting habits by providing the simplest possible daily check-in experience
**Unique Differentiator**: Radical simplicity - just tap to check in, see your streak, nothing more
**Success Metrics**: 
- 60% of users maintain 30-day streak within first 2 months
- Average session time under 30 seconds
- 80% daily active user rate

## Strategic Scope

### Core Value Features (MVP)
1. **Quick Add Habit** - Add habit in under 10 seconds
2. **One-Tap Check-in** - Daily habit completion in one tap
3. **Visual Progress** - Simple streak visualization
4. **Smart Reminders** - Contextual notifications at optimal times

### Strategic Exclusions (NOT Included)
1. **Social Features** - No sharing, teams, or competitions (dilutes core focus)
2. **Analytics Dashboard** - No complex charts or statistics (overwhelming)
3. **Gamification** - No points, badges, or rewards (artificial motivation)
4. **Habit Templates** - No preset habits (not personalized enough)

## Anti-Overengineering Constraints
- **Time Box**: 4 weeks maximum for MVP
- **Feature Limit**: 4 core features only
- **User Journey**: Value achieved in 2 taps from app open
- **Complexity Budget**: Any feature requiring >2 screens is too complex
```

## Phase 2: Task Creation (5 minutes)

### Converting Vision to Junior-Dev Tasks
```bash
claude-code --task="Use pro-vibe-dev/workflows/create-tasks.md to convert HabitFlow vision PRD into junior-developer tasks"
```

**Generated Tasks** (Sample):
```markdown
### Task 1: Create Habit Model and Service - Backend - High Priority - 3 hours

**User Story**: As a developer, I need a Habit data model and service so that habits can be stored and retrieved

**Acceptance Criteria**:
- [ ] Habit model with name, creation date, and streak count
- [ ] HabitService with CRUD operations
- [ ] Local storage using SwiftData
- [ ] Unit tests with 95%+ coverage

**Implementation Guidance**:
```swift
// 1. START WITH TESTS (Write these first!)
func testHabitCreation_ValidInput_CreatesHabit() async throws { }
func testHabitStreak_CheckIn_IncrementsStreak() async throws { }

// 2. Protocol-first design
protocol HabitServiceProtocol {
    func createHabit(name: String) async throws -> Habit
    func checkIn(habitId: UUID) async throws
    func fetchAllHabits() async throws -> [Habit]
}
```

**Quality Gates**: TDD Enforcer, Backend Agent validation

### Task 2: Create Habit List View - UI Frontend - High Priority - 2 hours

**User Story**: As a user, I want to see my habits in a simple list so I can quickly check them off

**Acceptance Criteria**:
- [ ] Simple list showing habit name and current streak
- [ ] One-tap check-in with haptic feedback
- [ ] VoiceOver announces "Check in [habit name], current streak [N] days"
- [ ] Empty state for no habits
```

## Phase 3: Step-by-Step Execution

### Executing the First Task
```bash
claude-code --task="Use pro-vibe-dev/workflows/task-execution.md to implement 'Create Habit Model and Service' task"
```

**Execution Flow with User Interaction**:

#### Step 1: Task Initialization
```
🤖: I'm about to implement: Create Habit Model and Service
    This task involves creating the data layer for habit tracking.
    Ready to proceed? (y/n)

👤: y
```

#### Step 2: Component Analysis
```
🤖: Analyzing existing components...
    No existing habit-related components found.
    This looks like a new foundation component.
    
    Should I create this as a reusable service pattern? (y/n)

👤: y
```

#### Step 3: Test-First Development
```
🤖: Following TDD, I'll create tests first. Here's what I'll test:
    
    1. Habit creation with valid input
    2. Streak increment on check-in
    3. Streak reset if day skipped
    4. Error handling for invalid input
    
    Look good? (y/n/modify)

👤: y

[System creates test file with failing tests]
```

#### Step 4: Implementation
```
🤖: Now implementing the Habit model and service to pass these tests...

[Shows implementation code]

✅ All tests are now passing!
✅ Code coverage: 97% for business logic

Shall I proceed with the build validation? (y/n)

👤: y
```

#### Step 5: Build & Validation
```
🤖: Running build and tests...

swift test
✅ All tests passed (12 tests in 0.43s)
✅ No compiler warnings
✅ SwiftLint validation passed

Please verify the implementation meets your expectations.
Continue to documentation updates? (y/n)

👤: y
```

#### Step 6: Documentation Updates
```
🤖: Documentation has been updated:
    - ✅ API documentation for HabitService
    - ✅ Architecture docs: Added data layer design
    - ✅ Task status: Marked complete in current-sprint.md
    
    Ready to prepare git commit? (y/n)

👤: y
```

#### Step 7: Git Commit
```
🤖: Suggested commit message:

feat: implement Habit model and service with SwiftData storage

- Created Habit model with name, creation date, and streak tracking
- Implemented HabitService with protocol-first design
- Added comprehensive unit tests (97% coverage)
- Integrated SwiftData for local persistence

Closes: TASK-001

Approve this commit message? (y/edit/cancel)

👤: y

[Git commit created but NOT pushed]

✅ Commit created successfully!
Next task ready: "Create Habit List View"
```

## Phase 4: UI Implementation with Component Reuse

### Executing UI Task
```bash
claude-code --task="Use task-execution.md to implement 'Create Habit List View' task"
```

**Component Discovery in Action**:
```
🤖: Analyzing existing components...
    
    Found potential matches:
    - GenericListView (40% match) - Basic list structure
    - CheckmarkRow (30% match) - Row with checkmark
    
    None are suitable for reuse. This looks like a new reusable component.
    
    Should I create HabitRowView as a reusable component? (y/n)

👤: y

🤖: Please describe the reusable component requirements:
    - Component name: HabitRowView
    - Props/parameters: habit (Habit), onCheckIn (() -> Void)
    - Variations needed: default, completed states
    - Future use cases: Main list, widget, Apple Watch

👤: [Confirms requirements]
```

**Accessibility-First Implementation**:
```swift
// Generated by UI Frontend Agent with Accessibility Expert
struct HabitRowView: View {
    let habit: Habit
    let onCheckIn: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(habit.name)
                    .font(.headline)
                
                Text("\(habit.currentStreak) day streak")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                onCheckIn()
            } label: {
                Image(systemName: habit.checkedInToday ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(habit.checkedInToday ? .green : .primary)
            }
        }
        .padding(.vertical, 8)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(habit.name), \(habit.currentStreak) day streak")
        .accessibilityHint(habit.checkedInToday ? "Already checked in today" : "Double tap to check in")
        .accessibilityAddTraits(habit.checkedInToday ? [.isSelected] : [])
    }
}
```

## Phase 5: Final Integration

### Complete Feature with All Components
```
🤖: All components for basic habit tracking are now complete:
    
    ✅ Backend: Habit model and service (tested)
    ✅ UI: HabitListView with accessibility (tested)
    ✅ Components: Reusable HabitRowView registered
    ✅ Integration: UI connected to service layer
    
    Full build and test results:
    - Unit tests: 24/24 passed
    - UI tests: 8/8 passed  
    - Accessibility: VoiceOver validated
    - Performance: 60fps scrolling confirmed
    
    Please run the app and test:
    1. Adding a habit
    2. Checking in (tap checkmark)
    3. VoiceOver navigation
    
    Everything working as expected? (y/n)

👤: y

🤖: Excellent! Preparing final commit...

    feat: implement habit list with accessible one-tap check-in

    - Created HabitListView with SwiftUI best practices
    - Implemented reusable HabitRowView component
    - Full VoiceOver support with meaningful labels
    - Connected to HabitService with proper state management
    - Added haptic feedback for check-ins
    - 100% accessibility compliance (WCAG AA)

    Component Registry Updated:
    - HabitRowView added as reusable component
    
    Closes: TASK-002
```

## Results Summary

### What Pro-Vibe-Dev Accomplished:
1. **Guided Strategy**: Created focused vision in 10 minutes with anti-overengineering constraints
2. **Automatic Planning**: Converted vision to junior-dev tasks in 5 minutes
3. **Quality Execution**: Step-by-step implementation with automatic agent activation
4. **Component Intelligence**: Discovered reuse opportunities and built component library
5. **Continuous Validation**: Tests passed, build succeeded, accessibility verified before any commit
6. **Knowledge Building**: Updated documentation, component registry, and architecture

### Time Comparison:
- **Without Pro-Vibe-Dev**: 2-3 days of unstructured development
- **With Pro-Vibe-Dev**: 4-5 hours of guided, quality-assured development

### Quality Outcomes:
- ✅ 96% test coverage achieved automatically
- ✅ Full accessibility compliance from day one
- ✅ Reusable component library started
- ✅ Clean architecture with protocol-first design
- ✅ No technical debt accumulated

This is how Pro-Vibe-Dev transforms AI-assisted development into a professional, efficient, and quality-driven process!