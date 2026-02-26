# Makefile for assembly fragments

AS = as
LD = ld
ASFLAGS = --64
LDFLAGS = -m elf_x86_64

# Pattern rules for assembling
%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

# and test targets
andtest.o: andtest.s
and.o: and.s
andtest: andtest.o and.o
	$(LD) $(LDFLAGS) -o $@ $^

# or test targets
ortest.o: ortest.s
or.o: or.s
ortest: ortest.o or.o
	$(LD) $(LDFLAGS) -o $@ $^

# imul test targets
imultest.o: imultest.s
imul.o: imul.s
imultest: imultest.o imul.o
	$(LD) $(LDFLAGS) -o $@ $^

# Clean target
clean:
	rm -f *.o andtest ortest imultest *.resbin

.PHONY: clean
