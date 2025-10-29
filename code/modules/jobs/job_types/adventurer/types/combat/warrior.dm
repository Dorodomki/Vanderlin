//shield sword
/datum/job/advclass/combat/sfighter
	title = "Fighter"
	tutorial = "Wandering sellswords, foolhardy gloryhounds, deserters, armed peasants... many and varied folk turn to the path of the fighter. Very few meet anything greater than the bottom of a tankard or the wrong end of a noose. ¿why do you fight? Gold? Fame? Justice? or because all you got left are your hands and the will to use them?"
	allowed_races = RACES_PLAYER_NONEXOTIC
	outfit = /datum/outfit/adventurer/sfighter
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 0
	cmode_music = 'sound/music/cmode/adventurer/CombatWarrior.ogg'


/datum/outfit/adventurer/sfighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)//sidearm skill
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, pick(1,1,2), TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, pick(0,1,1), TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.change_stat(STATKEY_INT, -1)// these guys aren't really smart to be honest

//UNIVERSAL GEAR
	shoes = pick(/obj/item/clothing/shoes/boots, /obj/item/clothing/shoes/boots/furlinedboots) // no armored boots for common adventurers.
	gloves = pick(/obj/item/clothing/gloves/leather, /obj/item/clothing/gloves/leather/advanced, /obj/item/clothing/gloves/fingerless, /obj/item/clothing/gloves/chain/iron)
	belt = /obj/item/storage/belt/leather/adventurer // new belt
	pants = pick(/obj/item/clothing/pants/tights/colored/black, /obj/item/clothing/pants/trou/leather/splint, /obj/item/clothing/pants/trou/leather) // you will have a chance to start with hope on your legs.
	backl = pick(/obj/item/storage/backpack/satchel, /obj/item/storage/backpack/satchel/cloth)
	beltr = /obj/item/storage/belt/pouch/coins/poor
	armor = pick(/obj/item/clothing/armor/chainmail/iron, /obj/item/clothing/armor/leather/splint, /obj/item/clothing/armor/cuirass/iron)
	wrists = pick(/obj/item/clothing/wrists/bracers/leather, /obj/item/clothing/wrists/bracers/ironjackchain)
	neck = pick(/obj/item/clothing/neck/chaincoif/iron, /obj/item/clothing/neck/gorget, /obj/item/clothing/neck/highcollier/iron, /obj/item/clothing/neck/coif/cloth, /obj/item/clothing/neck/coif)
	head = pick(/obj/item/clothing/head/helmet/skullcap, /obj/item/clothing/head/helmet/ironpot, /obj/item/clothing/head/helmet/sallet/iron, /obj/item/clothing/head/helmet/leather/headscarf)
	shirt = pick(/obj/item/clothing/armor/gambeson, /obj/item/clothing/armor/gambeson/light)
	r_hand = /obj/item/flashlight/flare/torch/prelit // they get back their missing torches
	if(H.age == AGE_OLD)// old warriors get inmunity to see gibs
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

	if(H.gender == FEMALE)
		H.underwear = "Femleotard"
		H.underwear_color = CLOTHING_SOOT_BLACK
		H.update_body()

	H.change_stat(STATKEY_STR, 2)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_INT, -1) // Muscle brains

	H.adjust_blindness(-3)

	var/weapons = list("shield & sword","Dualist axes", "Piker", "shield & bludgeon","Goedendag")
	var/weapon_choice = input("CHOOSE YOUR WEAPON!!!", "ROGVE UP!!!") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("shield & sword") // defensive adventurer = 1 skilled weapon + 2 rolls for average-skilled and 1 secured average (emergency daggers)
			to_chat(H, span_warning("You are a career swordsman, your time spent in battles and training allowed you to triumph with skill and power, always behind your shield for any upcoming arrow."))
			beltl = pick(/obj/item/weapon/scabbard/sword, /obj/item/weapon/sword/scimitar/messer, /obj/item/weapon/sword/sabre/scythe, /obj/item/weapon/sword/iron)
			l_hand = /obj/item/weapon/shield/heater
			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		if("shield & bludgeon") // defensive adventurer = 1 skilled weapon + 2 rolls for average-skilled and 1 secured average (emergency daggers)
			to_chat(H, span_warning("You are a career warrior who specialized in maces, your time spent in battles and training allowed you to triumph with well landed hits on anyone, always behind your shield for any upcoming arrow."))
			beltl = pick(/obj/item/weapon/mace/bludgeon, /obj/item/weapon/mace/warhammer, /obj/item/weapon/mace/spiked, /obj/item/weapon/hammer/sledgehammer)
			l_hand = /obj/item/weapon/shield/heater
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		if("Dualist axes") // offensive adventurer = 1 skilled weapon + 2 rolls for average-skilled and 1 secured average (emergency daggers)
			to_chat(H, span_warning("You are a career warrior who always was different, why a shield when you can use two weapons? you are quite skilled with using two weapons to tear your enemies apart."))
			beltl = /obj/item/weapon/axe/iron
			l_hand = /obj/item/weapon/axe/iron
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC)
		if("Piker") // defensive adventurer = 1 skilled weapon + 2 rolls for average-skilled and 1 secured average (emergency daggers)
			to_chat(H, span_warning("You are a career warrior, simple and effective for any kind of fight your spear and buckler are the terror of anyone and you know why."))
			beltl = /obj/item/weapon/shield/tower/buckleriron
			l_hand = /obj/item/weapon/spear
			H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		if("Goedendag") // offensive adventurer = 1 skilled weapon + 2 rolls for average-skilled and 1 secured average (emergency daggers)
			to_chat(H, span_warning("You are a career warrior, brutal and powerful your heavy weapon destroys anyone despite being armored or not."))
			l_hand = /obj/item/weapon/mace/goden
			beltl = /obj/item/weapon/shield/tower/buckleriron
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
