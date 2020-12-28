FROM alpine:latest
RUN apk add --no-cache samba && \
    adduser -D pishare && \
    echo "pishare:newpass" | chpasswd && \
    echo -e "newpass\nnewpass" | (smbpasswd -a pishare)
COPY --chown=root:root smb.conf /etc/samba/
CMD smbd --foreground --no-process-group --log-stdout --configfile /etc/samba/smb.conf
