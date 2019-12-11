FROM node:7-onbuild

LABEL maintainer "coursework_2"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

<<<<<<< HEAD
=======
# tell docker what port to expose
>>>>>>> 0559ad894507febe66fcc7f3d6f44d4e2ba543e2
EXPOSE 80
