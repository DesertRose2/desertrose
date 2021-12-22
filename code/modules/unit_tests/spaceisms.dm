// A test to check for spaceisms like Nanotrasen, Bluespace, etc.
// This adds a nontrivial amount of overhead, so it will probably be removed in the future.
GLOBAL_LIST_EMPTY(spaceisms_list)
/atom/Initialize(mapload, ...)
	. = ..()
	var/static/regex/spaceism_regex = regex("(nanotrasen|bluespace|syndicate)")
	if(spaceism_regex.Find(desc))
		spaceisms_list[type] = spaceism_regex.group[1]

/datum/unit_test/spaceisms/Run()
	for(var/spaceism in spaceisms_list)
		Fail("Spaceism found in [spaceism]: [spaceisms_list[spaceism]]")
