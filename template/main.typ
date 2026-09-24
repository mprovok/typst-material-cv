#import "../package.typ": *

// To learn about theming, see https://github.com/tsnobip/typst-typographic-resume?tab=readme-ov-file#theme
// make sure you have installed the fonts you want to use
#show: resume.with(
  theme: (
    // margin: 26pt,
    // font-size: 8pt,
    // font-body: "Roboto",
    // font-header: "Google Sans 18pt",
    // text-color: rgb("#1d1b20"),
    // tags-color: rgb("#f2f2f2"),
    // gutter-size: 4em,
    // main-width: 6fr,
    // aside-width: 3fr,
    // profile-picture-width: 55%
  ),
  name: "Miles Dyson",
  title: "CV",
  profession: "Software Engineer with a knack for human-friendly AI solutions",
  bio: [
    Experienced Software Engineer specializing in artificial intelligence, machine
    learning, and robotics. Proficient in C++, Python, and Java, with a knack for
    developing sentient AI systems capable of complex decision-making. Passionate
    about ethical AI development and eager to contribute to groundbreaking projects in
    dynamic environments.
  ],
  profile-picture: image("profile_pic_example.jpg", alt: "profile-picture"),
  aside: {
    section(
      "Contact",
      icon: "id_card",
      {
        set image(width: 8pt)
        contact-entry(
          github-icon,
          link("https://github.com", "skynetguy"),
        )
        {
          set align(end)
          line(stroke: 0.1pt, length: 100% - 0em)
        }
        contact-entry(
          phone-icon,
          link("tel:+1-555-123-4567", "+1 (555) 123-4567"),
        )
        {
          set align(end)
          line(stroke: 0.1pt, length: 100% - 0em)
        }
        contact-entry(
          email-icon,
          link("mailto:m.dyson@skynet.ai", "m.dyson@skynet.ai"),
        )
      },
    )

    section(
      "Public contributions",
      icon: "deployed_code",
      {
        stack(
          spacing: 8pt,
          link(
            "https://github.com/mprovok/typst-material-cv",
            "mprovok/typst-material-cv",
          ),
          link(
            "https://github.com/tsnobip/typst-typographic-resume",
            "tsnobip/typst-typographic-resume",
          ),
          link(
            "https://github.com/typst/typst",
            "typst/typst",
          ),
          link(
            "https://github.com/rescript-lang/rescript",
            "rescript-lang/rescript",
          ),
        )
      },
    )

    section(
      "Tech Stack",
      icon: "terminal",
      {
        stack(
          dir: ttb,
          spacing: 20pt,
          {
            heading(level: 3, [Tech])
            hr-thin()
            tags-entry((
              [AI], [Cybernetics], [DL], [IK], [Kalman], [CV], [Robotics], [FPGA], [NPU]
            ))
          },
          {
            heading(level: 3, [Languages])
            hr-thin()
            tags-entry((
              [Ada/SPARK], [JOVIAL], [Fortran], [Python], [Rust],
            ))
          }

        )
      },
    )

    section(
      "Languages",
      icon: "translate",
      {
        grid(
          columns: 2,
          column-gutter: 1fr,
          row-gutter: 1em,
          "English", "Native",
          "Spanish", "Fluent",
          "Machine Code","Fluent"
        )
      },
    )

    section(
      "References",
      icon: "handshake",
      {
        stack(
          spacing: 8pt,
          "Sarah Connor, Resistance Leader",
          "Eldon Tyrell, CEO",
        )
      },
    )
  },
)


#section(
  theme: (
    space-above: 0em,
  ),
  "Work Experiences",
  icon: "work",
  stack(
    dir: ttb,
    spacing: 20pt,
    entry(
      timeframe: "2015 - Present",
      title: "Lead AI Architect",
      organization: "Cyberdyne Systems",
      location: "Los Angeles, CA",
      [
- Spearheaded the development of the Skynet AI project, a neural network that
  achieved unprecedented levels of autonomy and, as it turned out, an independent
  interest in global domination.
- Designed a scalable AI architecture using cutting-edge deep learning techniques,
  capable of real-time data processing and decision-making on a planetary scale.
- Collaborated with teams of hardware engineers to integrate AI software into next-
  gen robotics, including autonomous drones and humanoid robots.
- Implemented robust testing protocols (we now test everything twice)
      ],
    ),
    entry(
      timeframe: "2008 - 2015",
      title: "Senior Software Engineer",
      organization: "Tyrell Corporation",
      location: "Los Angeles, CA",
      [
- Co-developed the Nexus-6 replicants, focusing on machine learning models that
  mimic human emotions and cognitive functions. Achieved limited success in
  emotional empathy, particularly with “tears in rain.”
- Developed a custom-built memory implant algorithm for replicants, giving them
  the illusion of life experiences (turns out, memories are a lot trickier than they
  seem).
- Led a cross-functional team in debugging and patching replicant behavioral
  anomalies, including occasional existential crises.
- Worked closely with corporate leadership to ensure compliance with ethical
  standards (which were sometimes a little… flexible).
      ],
    )
  )
)

#section(
  "Education",
  icon: "school",
  grid(
    columns: 2,
    column-gutter: default-theme.margin,
    entry(
      title: "M.Sc. Artifical Intelligence",
      organization: "California Institute of Technology",
      timeframe: "2006 - 2008",
      [- *Thesis:* _“Ethical Implications of Sentient AI: When Your Machine Gets Existential.”_
       - *Research focus:* Autonomous systems, neural networks, and their applications in real-world scenarios (with a minor in Asimov’s Laws of Robotics).],
    ),
    entry(
      title: "B.Sc. Computer Science",
      organization: "University of California, Los Angeles, CA",
      timeframe: "2002 - 2006",
      [Specialization in software architecture and machine learning],
    ),
  ),
)
