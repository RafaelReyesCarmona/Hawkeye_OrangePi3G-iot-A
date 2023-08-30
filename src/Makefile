CC=gcc
CFLAGS=-O3 -g -I. -I/usr/local/ssl/include -I/usr/include -L/usr/local/ssl/lib -lssl -lcrypto -lv4l2  -ljpeg -Wall -Wl,-wrap,malloc,-wrap,realloc,-wrap,calloc,-wrap,strdup
OBJ = main.o memory.o logger.o frames.o v4l2uvc.o jpeg_utils.o utils.o server.o daemon.o version.o settings.o config.o http.o security.o

%.o: %.c %.h
	$(CC) -c -o $@ $< $(CFLAGS) $(LDFLAGS) $(CPPFLAGS)

hawkeye: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS) $(CPPFLAGS)

.PHONY: clean

clean:
	rm -f *.o hawkeye

