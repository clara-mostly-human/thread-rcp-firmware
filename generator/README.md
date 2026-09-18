# Regenerating `firmware/`

`firmware/` is the output of Silicon Labs' `slc generate`, committed. Day-to-day builds never run
`slc` (closed source, x86_64 only, needs Java 21 despite its readme saying 17, and bundles telemetry
libraries). It is only needed again when the SDK version or the component list changes.

    docker build --platform linux/amd64 -t thread-rcp-generator:slc5.11 -f generator/Dockerfile .
    docker run --rm --pull=never --platform=linux/amd64 --network none \
        -v "$PWD/vendor/unpacked/simplicity_sdk:/sdk:ro" -v "$PWD/build/gen:/out" \
        thread-rcp-generator:slc5.11 bash -c 'slc signature trust --sdk /sdk && \
        slc generate /sdk/protocol/openthread/sample-apps/ot-ncp/ot-rcp.slcp -d /out -np --sdk /sdk \
            --with EFR32MG24A020F1024IM40 -o makefile --toolchain toolchain_gcc'

Always `--network none`. Then diff `build/gen` against the first commit of `firmware/` ("as
generated") and re-apply the board commit on top.
