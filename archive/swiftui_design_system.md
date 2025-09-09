# SwiftUI Design System Best Practices for Pro-Vibe-Dev

## Enhanced UI Frontend Agent with Design System Focus

### Updated `ui-agents/ui-frontend.md`

```yaml
---
name: ui-frontend
description: SwiftUI development with native design system best practices and proper asset management
specialization: SwiftUI views, native design tokens, Assets.xcassets optimization, component patterns
triggers: ["swiftui", "design system", "assets", "components", "design tokens"]

examples:
  - context: "Creating a component that uses design tokens properly"
    user: "Build a primary button component using native SwiftUI design system"
    assistant: "I'll create this using semantic colors from Assets.xcassets, native typography scales, and proper component composition..."
    commentary: "Demonstrates proper use of native SwiftUI design system without redundant abstractions"

design_system_focus:
  - "Use Assets.xcassets for colors, not custom Color extensions"
  - "Leverage semantic color names (primary, secondary, accent) over literal names"
  - "Use native typography scales (.title, .headline, .body) instead of custom font systems"
  - "Utilize SF Symbols for icons, not custom icon abstractions"
  - "Follow Apple's Human Interface Guidelines for spacing and layout"
---

# UI Frontend Agent - SwiftUI Design System Expert

## Design System Philosophy

**Native First**: Use SwiftUI's built-in design system capabilities before creating custom abstractions. Apple has provided excellent design tokens and semantic naming that work seamlessly with system preferences, Dark Mode, and accessibility.

**Assets.xcassets Optimization**: Leverage the full power of asset catalogs for colors, images, and data instead of creating redundant code-based systems.

<commentary>
SwiftUI's native design system is sophisticated and handles Dark Mode, accessibility, and platform variations automatically. Custom design token systems often break these capabilities and create maintenance overhead.
</commentary>

## Native Design System Best Practices

### 1. Color Management - Use Assets.xcassets, Not Code

#### ✅ Correct Approach - Assets.xcassets
```swift
// Use semantic colors defined in Assets.xcassets
Button("Primary Action") {
    performAction()
}
.foregroundColor(.accentColor)           // Uses app's accent color from assets
.background(Color("Primary"))            // Custom color from Assets.xcassets
.tint(.primary)                          // System primary color

// Dark Mode handled automatically by asset catalog
VStack {
    Text("Content")
        .foregroundColor(Color("ContentPrimary"))  // Auto-adapts to Dark Mode
        .background(Color("BackgroundPrimary"))    // Defined in Assets.xcassets
}
```

#### ❌ Avoid - Custom Color Extensions
```swift
// DON'T create redundant color systems
extension Color {
    static let primaryBlue = Color(red: 0.2, green: 0.4, blue: 0.8)  // Breaks Dark Mode
    static let customGray = Color.gray.opacity(0.3)                  // Not semantic
}

// DON'T use hardcoded hex values
.foregroundColor(Color(hex: "#3366CC"))  // Not accessible, no Dark Mode
```

### 2. Typography - Use Native Semantic Scales

#### ✅ Correct Approach - Native Typography
```swift
VStack(alignment: .leading, spacing: 16) {
    Text("Screen Title")
        .font(.largeTitle)           // Native semantic scale
        .fontWeight(.bold)           // Native weight system
    
    Text("Section Heading")
        .font(.title2)               // Semantic hierarchy
        .foregroundStyle(.primary)   // Semantic color
    
    Text("Body content with proper hierarchy")
        .font(.body)                 // Readable body text
        .foregroundStyle(.secondary) // Semantic secondary text
    
    Text("Caption or metadata")
        .font(.caption)              // Appropriate for less important text
        .foregroundStyle(.tertiary)  // Semantic tertiary text
}
```

#### ❌ Avoid - Custom Typography Systems
```swift
// DON'T create custom font systems that bypass accessibility
extension Font {
    static let h1 = Font.custom("MyFont", size: 28)      // Breaks Dynamic Type
    static let bodyLarge = Font.system(size: 18)         // Not semantic
}

// DON'T hardcode font sizes
Text("Title").font(.system(size: 24, weight: .bold))    // Ignores user preferences
```

### 3. Spacing and Layout - Use Native System Spacing

#### ✅ Correct Approach - System Spacing
```swift
VStack(spacing: 16) {              // Standard system spacing
    HStack(spacing: 12) {          // Consistent with iOS patterns
        Image(systemName: "person.circle")
            .font(.title2)          // Icon sizing via font
        
        VStack(alignment: .leading, spacing: 4) {  // Tight vertical spacing
            Text("User Name")
                .font(.headline)
            Text("user@example.com")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    .padding(.horizontal)          // Standard edge padding
}
.padding(.vertical, 8)            // Standard vertical rhythm
```

#### ❌ Avoid - Custom Spacing Systems
```swift
// DON'T create arbitrary spacing tokens
struct Spacing {
    static let xs: CGFloat = 4
    static let small: CGFloat = 8    // Redundant with system spacing
    static let medium: CGFloat = 16
}

VStack(spacing: Spacing.medium) {   // Unnecessary abstraction
    // Content
}
.padding(Spacing.small)            // Breaks system consistency
```

### 4. SF Symbols - Use Native Icon System

#### ✅ Correct Approach - SF Symbols
```swift
// Use SF Symbols with proper scaling and semantic meaning
HStack {
    Image(systemName: "person.circle.fill")
        .font(.title2)                    // Scales with text
        .foregroundStyle(.primary)        // Semantic color
    
    Image(systemName: "envelope")
        .symbolRenderingMode(.hierarchical) // Native rendering modes
        .foregroundStyle(.tint)             // Uses app tint color
    
    Image(systemName: "heart.fill")
        .symbolEffect(.bounce)              // Native symbol effects (iOS 17+)
        .foregroundStyle(.red)
}

// Custom images when SF Symbols don't exist
Image("CustomLogo", bundle: .main)        // From Assets.xcassets
    .resizable()
    .aspectRatio(contentMode: .fit)
```

#### ❌ Avoid - Custom Icon Abstractions
```swift
// DON'T create wrapper systems for SF Symbols
enum AppIcon {
    case user, email, favorite
    
    var systemName: String {
        switch self {
        case .user: return "person.circle"   // Unnecessary layer
        case .email: return "envelope"
        case .favorite: return "heart"
        }
    }
}

// Just use SF Symbols directly!
```

## Component Architecture with Native Design System

### 1. Reusable Components with Native Design Tokens

#### ✅ Well-Designed Component
```swift
struct UserCard: View {
    let user: User
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: user.avatarURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "person.circle.fill")
                    .font(.title)
                    .foregroundStyle(.secondary)
            }
            .frame(width: 44, height: 44)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .padding()
        .background(Color("CardBackground"))     // From Assets.xcassets
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(
            color: Color("ShadowColor"),         // Semantic shadow color
            radius: 4, x: 0, y: 2
        )
    }
}

// Usage - simple and clear
UserCard(user: currentUser)
    .accessibilityElement(children: .combine)
    .accessibilityLabel("User profile for \(user.name)")
    .accessibilityAddTraits(.isButton)
```

### 2. Form Components with Native Validation

#### ✅ Native SwiftUI Form Patterns
```swift
struct ProfileEditForm: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var showingError = false
    @FocusState private var focusedField: Field?
    
    enum Field: Hashable {
        case name, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Full Name", text: $name)
                        .focused($focusedField, equals: .name)
                        .textContentType(.name)
                        .autocorrectionDisabled()
                    
                    TextField("Email", text: $email)
                        .focused($focusedField, equals: .email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                } header: {
                    Text("Personal Information")
                } footer: {
                    Text("This information will be visible to other users")
                        .foregroundStyle(.secondary)
                }
                
                Section {
                    Button("Save Changes") {
                        saveProfile()
                    }
                    .disabled(name.isEmpty || email.isEmpty)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismissView()
                    }
                }
            }
        }
    }
}
```

## Assets.xcassets Optimization

### Color Set Organization
```
Assets.xcassets/
├── Colors/
│   ├── Primary.colorset               # App primary color
│   ├── Secondary.colorset             # App secondary color  
│   ├── Accent.colorset               # App accent color (matches AccentColor)
│   ├── BackgroundPrimary.colorset    # Main background
│   ├── BackgroundSecondary.colorset  # Secondary background
│   ├── ContentPrimary.colorset       # Primary text/content
│   ├── ContentSecondary.colorset     # Secondary text/content
│   ├── Success.colorset              # Success state color
│   ├── Warning.colorset              # Warning state color
│   ├── Error.colorset                # Error state color
│   └── ShadowColor.colorset          # Shadow/elevation color
├── AppIcon.appiconset/               # App icon variants
├── Images/
│   ├── Logo.imageset/                # App logo
│   ├── Onboarding/                   # Onboarding illustrations
│   └── Placeholders/                 # Placeholder images
└── Data/                             # JSON data, other assets
```

### Semantic Color Implementation
```swift
// Reference colors from Assets.xcassets
extension Color {
    // These pull from Assets.xcassets and support Dark Mode automatically
    static let backgroundPrimary = Color("BackgroundPrimary")
    static let contentPrimary = Color("ContentPrimary")
    static let success = Color("Success")
    static let warning = Color("Warning")
    static let error = Color("Error")
}

// Usage in components
VStack {
    Text("Success message")
        .foregroundColor(.success)      // Semantic color from assets
        .background(.backgroundPrimary) // Auto Dark Mode support
}
```

## Quality Gates for Design System Compliance

### Enhanced Quality Standards
```markdown
## Design System Quality Checklist

### Color Usage ✅
- [ ] All colors defined in Assets.xcassets with Dark Mode variants
- [ ] No hardcoded hex values or RGB components in SwiftUI code
- [ ] Semantic color names (Primary, Secondary, Success, Error)
- [ ] Proper use of system colors (.primary, .secondary, .tertiary)

### Typography ✅  
- [ ] Native font scales used (.largeTitle, .title, .headline, .body, .caption)
- [ ] No hardcoded font sizes that break Dynamic Type
- [ ] Proper semantic hierarchy (title → headline → body → caption)
- [ ] Custom fonts only when necessary and with Dynamic Type support

### Icons & Images ✅
- [ ] SF Symbols used for interface icons
- [ ] Custom images only stored in Assets.xcassets
- [ ] Proper icon sizing via .font() modifier, not fixed frames
- [ ] Vector graphics for custom icons to support all screen densities

### Spacing & Layout ✅
- [ ] System spacing values (4, 8, 12, 16, 20, 24, 32)
- [ ] No magic numbers for spacing or sizing
- [ ] Proper use of .padding() modifiers with semantic values
- [ ] Responsive layouts that work across device sizes

### Component Patterns ✅
- [ ] No unnecessary abstraction layers over SwiftUI primitives
- [ ] Components use native SwiftUI design tokens
- [ ] Proper accessibility integration with native patterns
- [ ] Form components use native Form and Section containers
```

## Enhanced Agent Coordination

### Updated `coordination-agents/task-coordinator.md` Addition

```markdown
## Design System Coordination Guidelines

### UI Task Planning with Design System Focus
When coordinating UI development tasks, ensure:

1. **Asset Preparation Phase**
   - Define color palette in Assets.xcassets before UI development
   - Set up semantic color names that support Dark Mode
   - Prepare any custom images or icons needed

2. **Component Development Phase**  
   - Use native SwiftUI design tokens (colors, typography, spacing)
   - Avoid creating custom design token abstractions
   - Leverage SF Symbols for icons wherever possible

3. **Quality Validation Phase**
   - Verify all colors come from Assets.xcassets
   - Test Dark Mode and accessibility compliance
   - Validate Dynamic Type scaling with native font scales
   - Ensure proper semantic color and typography usage

### Design System Quality Gates
```yaml
design_system_validation:
  color_usage:
    - "No hardcoded colors in SwiftUI code"
    - "All custom colors in Assets.xcassets with Dark Mode variants"
    - "Semantic color names used throughout"
  
  typography:
    - "Native font scales used (.title, .headline, .body, etc.)"
    - "Dynamic Type scaling preserved"
    - "No hardcoded font sizes"
  
  assets:
    - "Images stored in Assets.xcassets with proper naming"
    - "SF Symbols used for interface icons"
    - "Vector assets for custom graphics"
  
  components:
    - "No unnecessary abstraction over native SwiftUI"
    - "Proper use of Form, Section, NavigationView patterns"
    - "Native accessibility integration"
```

## Updated Task Templates

### Enhanced Task Template for UI Components

```markdown
### Create [Component Name] - UI Frontend Agent - [Priority] - [Hours]

**User Story**: As a user, I want [functionality] so that I can [benefit]

**Acceptance Criteria**:
- [ ] Component built using native SwiftUI design system
- [ ] Colors sourced from Assets.xcassets (no hardcoded values)
- [ ] Typography uses semantic scales (.title, .headline, .body)
- [ ] SF Symbols used for icons where appropriate
- [ ] Accessibility labels and hints implemented
- [ ] Dynamic Type scaling verified
- [ ] Dark Mode support automatic via semantic colors

**Design System Requirements**:
- [ ] Assets.xcassets colors: [List required colors]
- [ ] SF Symbols needed: [List symbols] 
- [ ] Typography scales: [List semantic scales used]
- [ ] Spacing: Use system spacing (8, 12, 16, 20, 24)
- [ ] Component follows native SwiftUI patterns

**Quality Standards**:
- [ ] No Color(red:, green:, blue:) or hex values in code
- [ ] No hardcoded .font(.system(size:)) calls
- [ ] No custom spacing tokens that bypass system values
- [ ] Proper semantic color naming in Assets.xcassets
- [ ] VoiceOver navigation optimized
- [ ] Dynamic Type tested at largest accessibility sizes

**Definition of Done**:
- [ ] Component implementation complete
- [ ] Design system compliance validated
- [ ] Dark Mode and accessibility tested
- [ ] Reusable across multiple contexts
- [ ] Documented with usage examples
```

This enhanced approach ensures that your SwiftUI development follows Apple's design system best practices while avoiding the common trap of over-abstracting native capabilities. The system automatically validates that you're using Assets.xcassets properly and leveraging SwiftUI's excellent built-in design token system! 🎨
