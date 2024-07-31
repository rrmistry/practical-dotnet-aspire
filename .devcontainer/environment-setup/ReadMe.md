# Environment Setup Feature

This Dev Container feature is used to setup common tools for the dev container

This allows to cache common setup steps into a docker layer.

This is preferred over "postCreateCommand.sh" which should only be used for build-time events (e.g. getting most up-to-date secrets, tokens, certificates, etc.)

For reference: https://containers.dev/implementors/features/
