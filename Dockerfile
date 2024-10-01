# Thank you Microsoft!  Thank you PowerShell!  Thank you Docker!
FROM mcr.microsoft.com/powershell AS powershell

FROM ruby:3.3.5-slim-bullseye AS jekyllrb

# Copy the module into the container
# Copy essentially everything from the PowerShell image into the final image
COPY --from=powershell /usr /usr
COPY --from=powershell /lib /lib
COPY --from=powershell /lib64 /lib64
COPY --from=powershell /bin /bin
COPY --from=powershell /opt /opt

# Set the module name to the name of the module we are building
ENV ModuleName=PSJekyll
ENV InstallPackages="build-essential","git"

# Copy the module into the container
RUN --mount=type=bind,src=./,target=/Initialize /bin/pwsh -nologo -command /Initialize/Container.init.ps1
# Set the entrypoint to the script we just created.
ENTRYPOINT [ "/bin/pwsh","-nologo","-noexit","-file","/Container.start.ps1" ]