RUN_COFFEE:=./node_modules/.bin/coffee


COFFEE:=$(shell find coffee -type f -name '*.coffee')
LIBJS:=$(COFFEE:coffee/%.coffee=lib/%.js)


all: $(LIBJS)


$(LIBJS): lib/%.js: coffee/%.coffee
	@mkdir -p $(dir $@)
	$(RUN_COFFEE) --bare --compile --output $(dir $@) $^



