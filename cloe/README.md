Cloe
====

<a href="https://connect.bosch.com/blogs/a72739d0-0f9b-49bd-a755-633c45f34f0c"
title="Cloe Bosch Connect Community"><img src="doc/images/connect.svg"/></a>
<a href="https://inside-docupedia.bosch.com/confluence/display/PJPH/Cloe"
title="Cloe on PJPH Docupedia"><img src="doc/images/docupedia.svg"/></a>
<a href="https://rb-tracker.bosch.com/tracker08/secure/RapidBoard.jspa?rapidView=4068&projectKey=PJSYM"
title="Cloe Track&Release Issues"><img src="doc/images/bugreport.svg"/></a>
<a href="doc/changelog.rst" title="Cloe Change Log"><img src="doc/images/changelog.svg"/></a>

Cloe empowers developers of automated-driving software components by providing
a unified interface to closed-loop simulation. It achieves this by abstracting
over environment and vehicle simulators and building upon these.

![Screenshot of Cloe, RViz, and VTD](doc/images/screenshot.png)

Using these abstractions, it is then possible to provide features such as the
following:

- Support for alternate simulators (currently: CarMaker or VTD)
- Testing with perfect ground-truth sensor data
- Phenomenological sensor models and fault-injection
- Dynamic and scripted event injection via trigger system
- Easy integration in continuous integration environments via Docker
- Access to running simulations via REST-based JSON API
- Visualization of function and simulation state via HTML5 and Javascript
- Simulation speed adjustments and debugging of system-under-test

For example, a developer of an ADAS can use these features to iterate more
quickly on a function before making an expensive trip with flashing a
system in a vehicle and driving around for several hours.

> Using Cloe helped us find a critical bug in 2 hours which in the vehicle
> would have probably taken several weeks to find. &ndash; *PJ-DC Developer*

Cloe aims to make it easy for developers to create a _Cloe Controller_ (also
known as _agent_ or _actor_) that acts as a binding between Cloe and the
system-under-test or ADAS (e.g. ACC, TJP).

For long-term development, the current strategy is to enable Cloe to be used
for massively scaled continuous-testing and evaluation with a multitude of
scenarios. Additionally, Cloe aims to simplify orchestration of simulation
suites. To this end, further features *may* include the support for scripting.
(For more information on the concreate roadmap, please talk to [Thomas Grosser](mailto:thomas.grosser@bosch.com).

It is important to note the **limitations of Cloe** and the project however, to
preclude misunderstandings:

- Cloe does not actually simulate the environment.
  > That would be a lot of work that would take many years to accomplish.
  > Instead we use other simulators, such as VTD and CarMaker to do the heavy
  > lifting. In that sense, Cloe is only middleware.
- Cloe is not a validation and verification framework, it is not certified for
  this purpose.
  > This may change in the future, but for now it's off the table.
- Cloe is not a virtual HIL, we abstract from any EE architecture.
  > We cannot provide the features that we do at EE abstraction level.
  > Additionally, this would not be performant enough for most of our
  > use-cases. Consider talking to the
  > [XIL team](mailto:gunnar.seebach@bosch.com) if you need this.
- No setup-and-forget simulation tool off-the-shelf.
  > You can't just `apt-get install cloe` (yet). Cloe has certain requirements
  > that must be met: at minimum you will need to write a controller-binding
  > from your ADAS to Cloe. See the [Requirements](#TODO) section.
- We cannot maintain your ADAS binding to Cloe, but we will help you.
  > We would like to focus on delivering high-quality Cloe features that
  > everyone can use. Also, we are not experts in your function domain.
  > That said, where we can help, we (probably) will.
- Writing GUIs is not our core-competence.
  > Our goals is to empower GUI-developers to be able to write the best GUI
  > they can to interact with Cloe, but anything we provide will be best-effort
  > only. Independent user-groups are encouraged to develop GUIs for their
  > use-cases. However, all core feature development occurs independent of this.

## Installation and Usage

Requirements that must be met before you can simulate with Cloe are currently
varied, and depend strongly on your specific use-case. In general, the
following is required:

- Linux operating system
  > Cloe is primarily developed under Linux for various reasons, but we
  > strive to make it as cross-platform as possible. See [Linux Requirements](#TODO).
- nVidia graphics card
  > Certain simulators, such as VTD, require that a physical nVidia graphics
  > card is available on the system. This makes virtualization difficult.
- Simulator with license
  > We currently support Vires VTD and IPG CarMaker as simulator bindings.
  > These tools are not for free however, and need to be somehow acquired.
  > In the future, we would like to support at least one open-source
  > simulator.
- Controller binding to Cloe
  > Cloe can't magically understand how to talk with your software:
  > you need to manually write a binding to Cloe. We will try to help
  > you where we can, however. See [Writing a Controller Binding](#TODO).

If the above requirements are fulfilled, and you have a controller binding,
then you essentially only have to do the following, adjusting as necessary
to your project:

 1. Clone the [Cloe repository](https://sourcecode.socialcoding.bosch.com/projects/cloe/repos/cloe)
 2. Install build- and runtime-dependencies
 3. Install a simulator binding (eg. VTD)
 4. Configure project and source the respective `setup.(bash|zsh)` file.
 5. Generate build files via CMake for your desired setup (`./configure [options]`).
 6. Build the project (`make all`)!

More detailed information can be found in [this document](doc/install.rst).
If the problem persists, contact us on RocketChat, write us a mail, or open an
issue on Track&Release.

## Contributing

<!--
- Contributing
  - Our Responsibility
  - Your Responsibility
-->

## Frequently Asked Questions

- What 3rd-party libraries do you use?
  > We use several open source libraries as part of Cloe, some of which
  > we ship with the Cloe source code. These can found in the `vendor/`
  > directory. The list of these included libraries and their licenses
  > can be found in the [LICENSE.md](LICENSE.md) file.
  >
  > We provide bindings to two commercial simulators. These bindings use
  > development files from these simulators, in part through simple includes,
  > in part through patch-files, as is technologically necessary.
  >
  > - Vires VTD
  > - IPG CarMaker
  >
  > Other libraries and tools we use that we link to at compile time but do not
  > ship can be found in [CMakeLists.txt](CMakeLists.txt). Sometimes we provide
  > a script to help install them. An incomplete list of these external
  > libraries and tools includes the following:
  >
  > - Cap'n Proto
  > - ZMQ
  > - Boost
  > - Eigen3
  >
  > Language development tools we currently use include the following, but
  > is not limited to:
  >
  > - GCC
  > - Git
  > - Python
  > - Clang
  > - CMake
  > - Bash, Zsh
  > - Docker
  > - Jenkins
  > - Doxygen

- Does Cloe support feature X for my controller Y?
  > This will be documented in the future.

- Will you implement my controller?
  > No, we will not. However, we will help you. Read the rest of this document
  > first, though please.

- How do I integrate Cloe in my CI pipeline?
  > This will be documented in the future. 
