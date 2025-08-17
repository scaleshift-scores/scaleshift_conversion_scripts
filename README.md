# ScaleShift: Alternative Musical Notation Conversion Scripts

Welcome to [**ScaleShift**](http://scaleshift.app), a platform that bridges traditional musical notation with cutting-edge alternative notation systems. Our mission is to make music more accessible, intuitive, and visually comprehensible by providing tools to convert between traditional musical notation and various alternative musical notation systems.

ScaleShift enables musicians, composers, educators, and music enthusiasts to explore and utilise alternative musical notations. Whether you're looking to experiment with chromatic notation systems, explore isomorphic layouts, or teach music theory through visual innovation, ScaleShift provides the conversion tools you need.

## 🎼 Alternative Notation Scripts

This repository contains LilyPond files (`.ly`) that implement various alternative musical notation systems. Each file provides a complete implementation that can be used to render musical scores in the corresponding notation.

Each file is implemented in our public platform [ScaleShift](http://scaleshift.app), where anyone can use it to convert their musical scores.

### - **Clairnote** (`clairnote.ly`)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clairnote SN was proposed originally by Paul Morris in 2018.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The proposal, as well as extensive documentation and software, can be found on the main website of the notation:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[**Official Website**](http://clairnote.org)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The current .ly implementation has been created by the original clairnote author and provided in the following link:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[**Official implementation**](https://clairnote.org/software/#creating)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[**Official implementation .ly file**](https://clairnote.org/lilypond/clairnote.ly)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[**Official implementation Repository**](https://gitlab.com/paulmorris/lilypond-clairnote)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The .ly file is published here as a copy of the original, to facilitate its implementation in the ScaleShift project

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other resources: [Clairnote at the Music Notation Project](https://musicnotation.org/system/clairnote-sn-paul-morris/)


### - **Chromatic Lyre** (`chromaticlyre.ly`)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chromatic Lyre was proposed originally by Jan Braunstein in 2009.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The proposal, as well as extensive documentation and software, can be found on the main website of the notation:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[**Official Website**](http://www.delos.cz/en/sheet_music/chromatic_lyre_notation.html)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The current .ly implementation has been created by the original chromatic lyre author and provided in the following link:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[**Official implementation**](http://www.delos.cz/en/sheet_music/lyrebird.html)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[**Official implementation .ly file**](http://www.delos.cz/en/sheet_music/lyrebird.ly) current version: 23.05.18

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The .ly file is published here as a copy of the original, to facilitate its implementation in the ScaleShift project

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other resources: [Chromatic Lyre at the Music Notation Project](https://musicnotation.org/system/chromatic-lyre-notation-by-jan-braunstein/)


### - **TwinNote** (`twinnote.ly`)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TwinNote was proposed originally by Paul Morris in 2009.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The proposal, as well as extensive documentation and software, can be found on the main website of the notation:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[**Official Website**](https://twinnote.clairnote.org/)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The current .ly implementation has been created by ScaleShift and is **EXPERIMENTAL**. It has been created following the documentation on the official website. We greatly value improvements to the current file. Some scripts can be found in the [software section](https://twinnote.clairnote.org/software/) of the official website.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other resources: [TwinNote at the Music Notation Project](https://musicnotation.org/system/twinnote-by-paul-morris/)


### - **MUTO** (`muto.ly`)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MUTO was proposed originally by the MUTO Music Method Foundation in 1995.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The proposal, as well as extensive documentation, can be found on the main website of the notation:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[**Official Website**](https://muto-method.com/en/index.html)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The current .ly implementation has been created by ScaleShift and is **EXPERIMENTAL**. It has been created following the documentation on the official website. We greatly value improvements to the current file.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Other resources: [MUTO at the Music Notation Project](https://musicnotation.org/system/muto-notation-by-muto-foundation/)



## Prerequisites

- **LilyPond 2.24.0 or later**
- Basic familiarity with LilyPond syntax


## 🤝 Contributing to ScaleShift

Any improvement to the existing files or new implementation will be implemented into the public platform [ScaleShift](http://scaleshift.app), so it can be easily used by anyone to convert their music scores.

#### 🔧 **Improve Existing Notations**
- **Enhance visual clarity** of existing notation systems
- **Optimize performance** and rendering quality
- **Fix bugs** and improve stability
- **Add missing features** or extend functionality

#### 🆕 **Implement New Musical Notations**
We're actively seeking implementations of new musical notations !!!

### Contribution Guidelines

If you don't have Git technical knowledge, you can contact us to share through the ScaleShift website contact form, to send us your new .ly file and we will publish it here and add it to the platform.

Otherwise, you can create a Pull Request here:

#### Code Contributions
1. **Fork** the repository
2. **Create feature branches** with descriptive names
3. **Follow LilyPond conventions** and maintain code quality
4. **Add documentation** to your repository
5. **Submit detailed pull requests** explaining your changes

### Other technical Documentation
- **LilyPond Manual**: [lilypond.org](http://lilypond.org/doc/)

## 🌟 Join Our Community

- **Spread the Word**: Help others discover alternative musical notations
- **Submit Issues**: Report bugs, request features, suggest improvements
- **Start Discussions**: Share ideas, ask questions, propose new notations
- **Contribute Code**: Implement new features or fix existing issues
- **Share Examples**: Show off your scores created with ScaleShift

## 📄 License

Please see individual files and official websites for specific licensing information. Scripts that are mentioned as explicitly created by ScaleShift are shared under an MIT open-source license.


## Contact

This project is led by Miguel Arana-Catania, Senior Research Software Engineer AI/NLP at the University of Oxford

Contact me directly or use the contact form on the [**ScaleShift**](http://scaleshift.app) website.

