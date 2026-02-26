cat > Makefile <<'EOF'
AS=as
LD=ld
ASFLAGS=--64 -g

all: andtest ortest imultest

and.o: and.s
	$(AS) $(ASFLAGS) -o $@ $<

or.o: or.s
	$(AS) $(ASFLAGS) -o $@ $<

imul.o: imul.s
	$(AS) $(ASFLAGS) -o $@ $<

andtest.o: andtest.s
	$(AS) $(ASFLAGS) -o $@ $<

ortest.o: ortest.s
	$(AS) $(ASFLAGS) -o $@ $<

imultest.o: imultest.s
	$(AS) $(ASFLAGS) -o $@ $<

andtest: andtest.o and.o
	$(LD) -o $@ $^

ortest: ortest.o or.o
	$(LD) -o $@ $^

imultest: imultest.o imul.o
	$(LD) -o $@ $^

clean:
	rm -f *.o andtest ortest imultest
EOF
