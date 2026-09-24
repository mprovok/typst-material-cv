#let default-theme = (
  margin: 26pt,
  font-size: 8pt,
  font-body: "Roboto",
  font-header: "Google Sans 18pt",
  text-color: rgb("#1d1b20"),
  tags-color: rgb("#f2f2f2"),
  gutter-size: 4em,
  main-width: 6fr,
  aside-width: 3fr,
  profile-picture-width: 55%
)

#let resume(
  title: "CV",
  name: "",
  profession: "",
  bio: "",
  profile-picture: none,
  theme: (),
  aside: [],
  main,
) = {
  // Function to pick a key from the theme, or a default if not provided
  let th(key, default: none) = {
    return if key in theme and theme.at(key) != none {
      theme.at(key)
    } else if default != none and default in theme and theme.at(default) != none {
      theme.at(default)
    } else if default != none {
      default-theme.at(default)
    } else {
      default-theme.at(key)
    }
  }

  set page(
    margin: (
      top: th("margin"),
      bottom: th("margin"),
      left: th("margin"),
      right: th("margin"),
    ),
  )
  set list(marker: [‣])

  set document(
    title: title,
    author: name,
  )

  // Fix for https://github.com/typst/typst/discussions/2919
  show heading.where(level: 1): set text(size: th("font-size"))
  show heading.where(level: 2): set text(size: th("font-size"))
  show heading.where(level: 3): set text(size: th("font-size"))

  show heading.where(level: 1): set text(font: th("font-header"), weight: 600)
  show heading.where(level: 2): set text(font: th("font-header"))
  show heading.where(level: 3): set text(font: th("font-header"))

  set text(font: th("font-body"), size: th("font-size"), fill: th("text-color"))

  set grid(columns: (th("gutter-size"), 1fr))

  stack(
    dir: ttb,
    spacing: 16pt,
    stack(
      dir: ttb,
      spacing: 8pt,
      {
        show heading: set text(size: 26pt)
        heading(level: 1, name)
      },
      {
        show heading: set text(size: 11pt, weight: 400, style: "italic")
        heading(level: 3, profession)
      }
    ),
    grid(
      columns: (th("aside-width"), th("main-width")),
      column-gutter: th("margin"),

      // Aside
      {
        {
          // Profile picture
          if profile-picture != none {
            v(0em)
            set block(radius: 100%, clip: true, below: 2em)
            set align(center)
            set image(width: th("profile-picture-width"))
            profile-picture
          }

          // Bio
          {
            set text(weight: 300, style: "italic", hyphenate: true)
            set par(leading: 0.8em)
            bio
          }
        }

        aside
      },

      // Content
      {
        v(-2em)
        v(-6pt)
        main
      }
    )
  )
}

#let contact-entry(
  theme: (),
  gutter,
  right,
) = {
  stack(
    dir: ltr,
    spacing: 2em,
    gutter,
    right
  )
}

#let chip(label, color) = {
  box(
    text(weight: 500, label),
    fill: rgb(color),
    radius: 3pt,
    inset: (x: 0.5em),
    outset: (y: 0.5em)
  )
}

#let tags-entry(
  theme: (),
  tags,
) = {
  let color = if "color" in theme {
    theme.color
  } else {
    default-theme.tags-color
  }

  set par(leading: 1.5em)
  tags.map(tag => chip(tag, color)).join(" ")
}

#let hr-thick() = {
  set block(above: 6pt, below: 14pt)
  line(stroke: 1pt, length: 100%)
}

#let hr-thin() = {
  set block(above: 6pt, below: 10pt)
  line(stroke: 0.1pt, length: 100%)
}

#let section(
  theme: (),
  title,
  body,
  icon: ""
) = {
  if "space-above" not in theme {
    v(1fr)
  } else {
    v(theme.space-above)
  }

  {
    show heading: set align(theme.align-title) if "align-title" in theme
    show heading: set align(end) if not "align-title" in theme
    heading(level: 2, {
      set align(bottom)
      stack(
        dir: ltr,
        text(upper(title)),
        if icon != "" {
          h(0.3em)
          text(font: "Material Symbols Rounded", weight: 400, size: 16pt, icon, baseline: 5pt)
        }
      )
    })
  }

  hr-thick()

  body
}

#let entry(
  theme: (),
  timeframe: "",
  title: "",
  organization: "",
  location: "",
  body,
) = {
  stack(
    dir: ttb,
    spacing: 5pt,
    stack(
      dir: ltr,
      spacing: 1fr,
      context {
        set text(weight: 300, fill: text.fill.lighten(30%))
        timeframe
      },
      context {
        set align(horizon)
        set text(weight: 300, fill: text.fill.lighten(30%))
        location
      },
    ),
    heading(level: 3, title),
    organization
  )

  hr-thin()

  context {
    set par(leading: 0.8em)
    body
  }
}

#let github-icon = box(image("images/github-brands.svg", alt: "github icon", width: 12pt, height: 12pt), inset: (y: -0.3em))

#let phone-icon = box(text(font: "Material Symbols Rounded", weight: 400, size: 12pt, "phone_enabled", variations: ("FILL": 1)), inset: (y: -0.3em))
#let email-icon = box(text(font: "Material Symbols Rounded", weight: 400, size: 12pt, "mail", variations: ("FILL": 0)), inset: (y: -0.3em))
