AS=as
LD=ld
ASFLAGS=--64 -g

all: andtest ortest imultest

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

andtest: andtest.o and.o
	$(LD) -o $@ $^

ortest: ortest.o or.o
	$(LD) -o $@ $^

imultest: imultest.o imul.o
	$(LD) -o $@ $^

clean:
	rm -f *.o andtest ortest imultest
