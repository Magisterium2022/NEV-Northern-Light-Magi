/datum/antagonist/host
	id = ROLE_HOST
	role_text = "Borer Host"
	role_text_plural = "Borer Hosts"
	restricted_jobs = list("AI", "Robot")
	protected_jobs = list(JOBS_CHURCH, JOBS_COMMAND)
	bantype = ROLE_BANTYPE_HOST
	welcome_text = "The systems of the Northern Light are old and complex,\
with myriad hidden passages, access ports, and internal systems. Somewhere among that warren of tunnels, there lies a Borer nest.\n \n \
Cortical Borers roam freely in some shipsectors, and recently, a new threat has emergend, as these symbiotes access the frozen depths of Cryosuspension.\
Many people now find themselves awakening from Cryo with a new passenger in their body.\n\n\

	antaghud_indicator = "hudborer"


	survive_objective = null
	allow_neotheology = TRUE

/datum/antagonist/host/special_init()
	owner.current.make_host()

/datum/antagonist/host/can_become_antag(datum/mind/player)
	if(..() && ishuman(player.current))
		var/mob/living/carbon/human/H = player.current
		if(H.isSynthetic())
			return FALSE
		if(H.species.flags & NO_SCAN)
			return FALSE
		return TRUE
	return FALSE

/datum/antagonist/host/equip()
	var/mob/living/L = owner.current

/mob/proc/make_host()
	var/mob/living/carbon/human/user = src
	if(istype(user))
		var/obj/item/organ/external/head = user.get_organ(BP_HEAD)
		if(head)
			var/obj/item/organ/internal/borer/B = new /obj/item/organ/internal/borer
			B.replaced(chest)
