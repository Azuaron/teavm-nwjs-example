# teavm-nwjs-example
Example project where code is written in Scala with a target of TeaVM, then the TeaVM project
is built as an NW.js desktop application.

NW.js build environment is Docker, so should be buildable from any host with Docker installed.
Unfortunately, this does mean the `core/target/` folder has a `root` directory in it, which
will regularly need to be `chown` or `sudo mvn clean` to be handled.

Currently, builds only `linux64` distribution.

Built application is in `core/target/example-${revision}-nwjs/example/linux64`. Application
can be run with `./core/target/example-${revision}-nwjs/example/linux64/example` after
packaging (`mvn package`) the project.
