include config.mk

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)

all: options $(EXEC)

options: config.mk
	@echo "CC      = $(CC)"
	@echo "CFLAGS  = $(CFLAGS)"
	@echo "LDFLAGS = $(LDFLAGS)"
	@echo "EXTRA   = $(EXTRA_CFLAGS)"

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJ):
	$(CC) -c $(CFLAGS) $*.c

clean:
	rm -fv *.o

mrproper: clean
	rm -fv $(EXEC)
