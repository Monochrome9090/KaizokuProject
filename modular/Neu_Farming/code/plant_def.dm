#define FAST_GROWING 5 MINUTES
#define VERY_FAST_GROWING 4 MINUTES
#define QUICK_MATURING 2 MINUTES
#define HUNGRINESS_DEMANDING 30
#define HUNGRINESS_NORMAL 20
#define HUNGRINESS_SMALL 15
#define HUNGRINESS_TINY 10

/datum/plant_def
	abstract_type = /datum/plant_def
	/// Name of the plant
	var/name = "Some plant"
	/// Description of the plant
	var/desc = "Sure is a plant."
	var/icon = 'modular/Neu_Farming/icons/crops.dmi'
	var/icon_state
	/// Loot the plant will yield for uprooting it
	var/list/uproot_loot
	/// Time in ticks the plant will require to mature, before starting to make produce
	var/maturation_time = 6 MINUTES
	/// Time in ticks the plant will require to make produce
	var/produce_time = 3 MINUTES
	/// Typepath of produce to make on harvest
	var/produce_type
	/// Amount of minimum produce to make on harvest
	var/produce_amount_min = 2
	/// Amount of maximum produce to make on harvest
	var/produce_amount_max = 3
	/// How much nutrition will the plant require to mature fully
	var/maturation_nutrition = HUNGRINESS_NORMAL
	/// How much nutrition will the plant require to make produce
	var/produce_nutrition = HUNGRINESS_TINY
	/// If not perennial, the plant will uproot itself upon harvesting first produce
	var/perennial = FALSE
	/// Whether the plant is immune to weeds and will naturally deal with them
	var/weed_immune = FALSE
	/// The rate at which the plant drains water, if zero then it'll be able to live without water
	var/water_drain_rate = 1 / (2 MINUTES)
	/// Color all seeds of this plant def will have, randomised on init
	var/seed_color
	/// Whether the plant can grow underground
	var/can_grow_underground = FALSE

/datum/plant_def/New()
	. = ..()
	var/static/list/random_colors = list("#fffbf7", "#f3c877", "#5e533e", "#db7f62", "#f39945")
	seed_color = pick(random_colors)

/datum/plant_def/wheat
	name = "wheat stalks"
	icon_state = "wheat"
	produce_type = /obj/item/natural/chaff/wheat
	produce_amount_min = 3
	produce_amount_max = 6
	uproot_loot = list(/obj/item/natural/fibers, /obj/item/natural/fibers)
	maturation_time = FAST_GROWING
	water_drain_rate = 0

/datum/plant_def/oat
	name = "oat stalks"
	icon_state = "oat"
	produce_type = /obj/item/natural/chaff/oat
	produce_amount_min = 3
	produce_amount_max = 6
	uproot_loot = list(/obj/item/natural/fibers, /obj/item/natural/fibers)
	maturation_time = FAST_GROWING
	produce_time = QUICK_MATURING
	water_drain_rate = 0

/datum/plant_def/apple
	name = "apple tree"
	icon_state = "apple"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/apple
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	maturation_nutrition = HUNGRINESS_DEMANDING
	produce_nutrition =  HUNGRINESS_SMALL

/datum/plant_def/pear
	name = "pear tree"
	icon_state = "pear"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/pear
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	maturation_nutrition = HUNGRINESS_DEMANDING
	produce_nutrition =  HUNGRINESS_SMALL

/datum/plant_def/pipeweed
	name = "westleach leaf"
	icon_state = "westleach"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/rogue/pipeweed
	produce_amount_min = 3
	produce_amount_max = 5
	water_drain_rate = 0

/datum/plant_def/sweetleaf
	name = "swampweed"
	icon_state = "swampweed"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/rogue/swampweed
	produce_amount_min = 3
	produce_amount_max = 5
	water_drain_rate = 0

/datum/plant_def/berry
	name = "berry bush"
	icon_state = "berry"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/berries/rogue
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = HUNGRINESS_DEMANDING
	produce_nutrition =  HUNGRINESS_SMALL

/datum/plant_def/berry_poison
	name = "berry bush"
	icon_state = "berry"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/berries/rogue/poison
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE

/datum/plant_def/cabbage
	name = "cabbage patch"
	icon_state = "cabbage"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/cabbage
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = HUNGRINESS_SMALL
	produce_nutrition =  HUNGRINESS_SMALL
	maturation_time = FAST_GROWING
	produce_time = QUICK_MATURING

/datum/plant_def/potato// cheap to grow
	name = "potato plant"
	icon_state = "potato"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/potato
	produce_amount_min = 3
	produce_amount_max = 5
	maturation_nutrition = HUNGRINESS_SMALL
	produce_nutrition =  HUNGRINESS_TINY
	maturation_time = VERY_FAST_GROWING
	produce_time = QUICK_MATURING

/datum/plant_def/onion
	name = "onion patch"
	icon_state = "onion"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/onion
	produce_amount_min = 3
	produce_amount_max = 4
	produce_nutrition =  HUNGRINESS_TINY
	produce_nutrition =  HUNGRINESS_SMALL

/datum/plant_def/sunflower// cheap to grow
	name = "sunflowers"
	icon_state = "sunflower"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/sunflower
	produce_amount_min = 3
	produce_amount_max = 4
	maturation_nutrition = HUNGRINESS_SMALL
	produce_nutrition =  HUNGRINESS_TINY
	maturation_time = VERY_FAST_GROWING
	produce_time = QUICK_MATURING
	water_drain_rate = 0

/datum/plant_def/turnip // cheap to grow
	name = "turnip patch"
	icon_state = "turnip"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/turnip
	produce_amount_min = 3
	produce_amount_max = 5
	maturation_nutrition = HUNGRINESS_SMALL
	produce_nutrition =  HUNGRINESS_TINY
	maturation_time = FAST_GROWING
	produce_time = QUICK_MATURING

/*
/datum/plant_def/rice
	name = "rice stalks"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "rice"
	produce_type = /obj/item/natural/chaff/rice
	produce_amount_min = 3
	produce_amount_max = 4
	uproot_loot = list(/obj/item/natural/fibers, /obj/item/natural/fibers)
	maturation_nutrition = 30
	produce_nutrition = 20
	maturation_time = 5 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/garlic
	name = "garlic patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "garlic"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/garlic
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/amanita
	name = "strange red mushroom patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "amanita"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/amanita
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES
	weed_immune = TRUE
	can_grow_underground = TRUE
*/

#undef FAST_GROWING
#undef VERY_FAST_GROWING
#undef QUICK_MATURING

#undef HUNGRINESS_DEMANDING
#undef HUNGRINESS_NORMAL
#undef HUNGRINESS_SMALL
#undef HUNGRINESS_TINY