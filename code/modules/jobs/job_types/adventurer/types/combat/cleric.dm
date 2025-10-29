//shield
/datum/job/advclass/combat/cleric
	title = "Cleric"
	tutorial = "Clerics are wandering warriors of the Gods, \
	drawn from the ranks of temple acolytes who demonstrated martial talent. \
	Protected by armor and zeal, they are a force to be reckoned with."
	allowed_races = RACES_PLAYER_NONHERETICAL
	outfit = /datum/outfit/adventurer/cleric
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 0
	total_positions = 4
	allowed_patrons = ALL_CLERIC_PATRONS

/datum/outfit/adventurer/cleric/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'

	head = pick(/obj/item/clothing/head/helmet/skullcap, /obj/item/clothing/head/helmet/ironpot, /obj/item/clothing/head/helmet/sallet/iron, /obj/item/clothing/head/helmet/leather/headscarf)
	armor = pick(/obj/item/clothing/armor/chainmail/iron, /obj/item/clothing/armor/leather/splint, /obj/item/clothing/armor/cuirass/iron)
	shirt = /obj/item/clothing/armor/gambeson
	gloves = /obj/item/clothing/gloves/leather
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	neck = pick(/obj/item/clothing/neck/chaincoif/iron, /obj/item/clothing/neck/gorget, /obj/item/clothing/neck/highcollier/iron, /obj/item/clothing/neck/coif/cloth, /obj/item/clothing/neck/coif)
	belt = /obj/item/storage/belt/leather/adventurer
	backl = pick(/obj/item/storage/backpack/satchel, /obj/item/storage/backpack/satchel/cloth)
	r_hand = /obj/item/flashlight/flare/torch/prelit // they get back their missing torches
	//I assume they were given something for the journey by another parish, or the one they departed from
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1, /obj/item/reagent_containers/food/snacks/hardtack = 1)

	switch(H.patron?.type)
		if(/datum/patron/divine/astrata)
			wrists = /obj/item/clothing/neck/psycross/silver/astrata
			cloak = /obj/item/clothing/cloak/stabard/templar/astrata
			H.cmode_music = 'sound/music/cmode/church/CombatAstrata.ogg'
		if(/datum/patron/divine/dendor)
			wrists = /obj/item/clothing/neck/psycross/silver/dendor
			cloak = /obj/item/clothing/cloak/stabard/templar/dendor
			H.cmode_music = 'sound/music/cmode/garrison/CombatForestGarrison.ogg'
		if(/datum/patron/divine/necra)
			wrists = /obj/item/clothing/neck/psycross/silver/necra
			cloak = /obj/item/clothing/cloak/stabard/templar/necra
			H.cmode_music = 'sound/music/cmode/church/CombatGravekeeper.ogg'
			ADD_TRAIT(H, TRAIT_DEADNOSE, TRAIT_GENERIC)//accustomed to death
			beltr = /obj/item/weapon/shovel/small //so they can bury the dead
		if(/datum/patron/divine/eora)
			wrists = /obj/item/clothing/neck/psycross/silver/eora
			cloak = /obj/item/clothing/cloak/stabard/templar/eora
			H.cmode_music = 'sound/music/cmode/church/CombatEora.ogg'
			H.virginity = FALSE
			ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)
		if(/datum/patron/divine/ravox)
			wrists = /obj/item/clothing/neck/psycross/silver/ravox
			cloak =  /obj/item/clothing/cloak/stabard/templar/ravox
			H.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander2.ogg'
			H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE) // the devouts of the god of war got hands
		if(/datum/patron/divine/noc)
			wrists = /obj/item/clothing/neck/psycross/silver/noc
			cloak = /obj/item/clothing/cloak/stabard/templar/noc
			H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		if(/datum/patron/divine/pestra)
			wrists = /obj/item/clothing/neck/psycross/silver/pestra
			cloak = /obj/item/clothing/cloak/stabard/templar/pestra
			H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		if(/datum/patron/divine/abyssor)
			wrists = /obj/item/clothing/neck/psycross/silver/abyssor
			cloak = /obj/item/clothing/cloak/tabard/crusader
			H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
			beltl = /obj/item/fishingrod //no attachements, cleric can either discard it or embrace abyssor and fish like man was made to do
			H.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
		if(/datum/patron/divine/malum)
			wrists = /obj/item/clothing/neck/psycross/silver/malum
			cloak = /obj/item/clothing/cloak/stabard/templar/malum
			H.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander2.ogg'
		if(/datum/patron/divine/xylix)
			wrists = /obj/item/clothing/neck/psycross/silver/xylix
			cloak = /obj/item/clothing/cloak/stabard/templar/xylix
			H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		else // Failsafe
			cloak = /obj/item/clothing/cloak/tabard/crusader // Give us a generic crusade tabard
			wrists = /obj/item/clothing/neck/psycross/silver // Give us a silver psycross for protection against lickers
			H.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'

	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/mathematics, 2, TRUE)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) // old clerics aren't afraid of blood, inhumen or monsters, they have seen most of it and are old now
	H.change_stat(STATKEY_STR, 1)
	H.change_stat(STATKEY_INT, 1)
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_END, 2)
	H.change_stat(STATKEY_SPD, -1)
	if(!H.has_language(/datum/language/celestial)) // For discussing church matters with the other Clergy
		H.grant_language(/datum/language/celestial)
		to_chat(H, "<span class='info'>I can speak Celestial with ,c before my speech.</span>")
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) // Even if it has limited slots, it is a common drifter role available to anyone. Their armor also is not heavy, so medium armor training is enough
	var/holder = H.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_cleric()
		devotion.grant_to(H)

	H.adjust_blindness(-3)
	var/weapons = list("shield & sword","Flagellant", "Piker", "shield & bludgeon","Fanatic")
	var/weapon_choice = input("CHOOSE YOUR WEAPON!!!", "ROGVE UP!!!") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("shield & sword")
			to_chat(H, span_warning("Your holy weapon is the noble sword, since then find a proper blade has became a hard task."))
			beltr = pick(/obj/item/weapon/scabbard/sword, /obj/item/weapon/sword/scimitar/messer, /obj/item/weapon/sword/sabre/scythe, /obj/item/weapon/sword/iron)
			l_hand = pick (/obj/item/weapon/shield/heater, /obj/item/weapon/shield/wood)
			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		if("shield & bludgeon")
			to_chat(H, span_warning("Your holy weapons are crude bludgeons made to smash the enemy, followed by your shield to show your faith to the face of your adversary."))
			beltr = pick(/obj/item/weapon/mace/bludgeon, /obj/item/weapon/mace/warhammer, /obj/item/weapon/mace/spiked, /obj/item/weapon/hammer/sledgehammer)
			if(H.dna?.species)
				if(iself(H) || ishalfelf(H))
					beltr = /obj/item/weapon/mace/elvenclub// i don't wanna end up in someone oc being unable to get his quirky mace so the elfs get a pickup exclusive to their clubs, everyone else random gear
			l_hand = pick (/obj/item/weapon/shield/heater, /obj/item/weapon/shield/wood)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		if("Flagellant")
			to_chat(H, span_warning("Your holy weapons are the punishment instruments, with them you can spread your holy word from close and far."))
			beltr = /obj/item/weapon/whip/chain
			l_hand = /obj/item/weapon/whip/chain
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC)
		if("Piker")
			to_chat(H, span_warning("your holy weapon of choice was the spear, it pierces your enemies from afar while it keeps you and your companions safe ."))
			beltr = /obj/item/weapon/shield/tower/buckleriron
			l_hand = /obj/item/weapon/spear
			H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		if("Fanatic")
			to_chat(H, span_warning("Your weapon isn't holy, is a reinforced field tool, your true weapon is the faith you employ to destroy your adversary."))
			l_hand = /obj/item/weapon/flail/peasant
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
