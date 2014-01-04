<?php 
/*************************************************************************** 
* 						lang_adr.php [English] 
* 							------------------- 
*
* 						Translation : 
* 					Forums : 
* 
****************************************************************************/ 

// General language keys
$lang['your_character_lack']='You first need to create a character before performing this action';
$lang['return'] = 'Click %shere%s to return to the previous page';
$lang['lack_points']= 'You cannot afford this action';
$lang['lack_sp']= 'You have not acquired enough Spirit Points (SP) to complete this action';
$lang['default_points_name']='Points';
$lang['character_lack']='This user has not created a character yet';
$lang['character_ban']='The administrator of this forum has banned you from using any of the RPG features.<br /><br />Please contact your administrator for further details.';
$lang['races_name']='Name';
$lang['races_desc']='Description';
$lang['races_image']='Image';
$lang['copyright']='Credits';
$lang['days']='days';
$lang['day']='day';
$lang['hours']='hours';
$lang['hour']='hour';
$lang['minutes']='minutes';
$lang['minute']='minute';
$lang['less_min']='Less than a minute ago.';
$lang['show_only_mine']='Only show items available to me';
$lang['show_all']='Show all items';
$lang['shops_no_thief']='Sorry, prisoners are not permitted in this area.';

// Abrev. characteristic keys
$lang['char_lvl']='Lvl';
$lang['char_dex']='Dex';
$lang['char_int']='Int';
$lang['char_wis']='Wis';
$lang['char_str']='Str';
$lang['char_cha']='Cha';
$lang['char_con']='Con';
$lang['char_restrict_title']='Min. Restrictions';
$lang['shop_stolen_info']='%sStolen%s %s from %s on %s%s';
$lang['shop_stolen_by_you']='me';
$lang['shop_stolen_by']='by %s';
$lang['shop_stolen_no_sell']='Some of your items were not sold!';
$lang['shop_stolen_no_sell1']='%s%s%s is a stolen item and no store keepers will purchase this from you.';
$lang['shop_stolen_no_sell2']='Try selling stolen items in your own store.';
$lang['shop_inventory_link']='Click %shere%s to return to your inventory.';
$lang['shop_steal_min_lvl']='You are not high enough level to use the Thief skill.';
$lang['shop_steal_min_lvl2']='The minimum character level for this skill is %s%s%s.';
$lang['shop_donated_by']='%sDonated%s by %s on %s%s';

$lang['lack_sp']= 'You have not acquired enough %s to complete this transaction';
$lang['lack_fp']= 'You have not acquired enough %s to complete this transaction';
$lang['update_quota_timer']='Update Due Soon...';
$lang['shop_total_items']='Total Items';
$lang['my']='My ';
$lang['character_prefs_updated']='Your preferences have been updated';
$lang['items_select_action']='Select an action';
$lang['quick_nav']='Quick Navigation';
$lang['not_authed']='You are not authorised to do this';
$lang['misc_page_name']='My Control Panel';
$lang['disabled_admin_msg1']='Administration mode';
$lang['disabled_admin_msg2']='RPG is disabled to normal users at the moment.';
$lang['disabled_dbupdate_error']='You MUST delete the "db_update.php" from your server for security reasons!';
$lang['items_type_all']='All';
$lang['items_select']='Category';
$lang['items_select_quantity']='Quantity to buy:';
$lang['disable_rpg'] = 'The RPG is currently disabled';
$lang['posts'] = 'Sorry, but you do not meet the minimum post count to create a new character';
$lang['On']='On';
$lang['Off']='Off';
$lang['Closed']='View Only';
$lang['year']='Year: ';
$lang['month']='Month: ';
$lang['week']='Week: ';
$lang['day']='Day: ';
$lang['hour']='Hour: ';
$lang['faq_title']='RPG FAQ';
$lang['Dispose']='Dispose';
$lang['shops_no_thief']='Sorry, prisoners are not permitted in this area.';

// Skills
$lang['skill_mining_desc']='Mining Skill';
$lang['skill_stone_desc']='Stone Cutting Skill';
$lang['skill_forge_desc']='Forge Skill';
$lang['skill_enchantment_desc']='Enchantment Skill';
$lang['skill_trading_desc']='Trading Skill';
$lang['skill_thief_desc']='Theft Skill';

// Reporting cheats to admin
$lang['report_pm_sub']='A hack attempt has been made within ADR';
$lang['report_pm_msg']='A hack attempt has been made by the user %s. The user has attempted to access the admin only shop via a direct URL address but failed';
$lang['report_pm_msg2']='A hack attempt has been made by the user %s. The user has attempted to use a Vault exploit to gain infinite cash but failed because the exploit has now been fixed';
$lang['report_pm_pvp']='A hack attempt has been made by the user %s. The user has attempted to use a PvP battle exploit to gain infinite cash and experience but failed because the exploit has now been fixed';

// Warehouse & shop tax keys
$lang['tax_pm_sub']='[RPG] Notification of taxes paid';
$lang['character_warehouse_closed']='You are not able to pay your %s %s rent on your open Warehouse. It has now been closed.';
$lang['character_shop_closed']='You are not able to pay your %s %s rent on your open Shop. It has now been closed.';
$lang['character_warehouse_tax']='You have been charged %s %s for your open Warehouse.';
$lang['character_shop_tax']='You have been charged %s %s for your open Shop.';
$lang['character_quota_timer']='Next Quota Replenish';
$lang['prefs_tax_pm_notify']='Enable PM notification of shop & warehouse taxes';

if ( defined ( 'IN_CHARACTER' ))
{
	$lang['character_new']='Creation of a new character';
	$lang['character_status_jail_topic']='Status: %sJailed%s';
	$lang['stats_rank']='Rank: %s of %s';
	$lang['pvp_post_attack']='Attack!';
	$lang['pvp_post_your_turn']='Your Turn!';
   	$lang['pvp_post_text']='PvP';
	$lang['pvp_post_opponent_turn']='%s\'s Turn';
	$lang['monster_list_hp']='HP';
	$lang['monster_list_mp']='MP';
	$lang['monster_list_att']='Att';
	$lang['monster_list_def']='Def';
	$lang['monster_list_ma']='Magic Att';
	$lang['monster_list_md']='Magic Def';
	$lang['character_battle_stats_title']='Battle Statistics';
	$lang['character_characteristics']='Characteristics';
	$lang['character_power']='Strength';
	$lang['character_agility']='Dexterity';
	$lang['character_endurance']='Constitution';
	$lang['character_intelligence']='Intelligence';
	$lang['character_willpower']='Wisdom';
	$lang['character_charm']='Charm';
	$lang['character_ma']='Magic Attack';
	$lang['character_md']='Magic Resistance';
	$lang['character_ac']='Armour Class';
	$lang['character_sp']='Spirit Points';
	$lang['character_fp']='Faction Points';
	$lang['character_stats_monster']='Monster Battles';
	$lang['character_stats_pvp']='PvP Battles';
	$lang['character_reroll']='Reroll';
	$lang['character_races_select']='Select a race:';
	$lang['character_elements_select']='Select an element:';
	$lang['character_alignments_select']='Select an alignment:';
	$lang['character_races_mini_faq']='Information about this race';
	$lang['character_elements_mini_faq']='Information about this element';
	$lang['character_alignments_mini_faq']='Information about this alignment';
	$lang['character_new_name']='Choose a name for your character: ';
	$lang['character_characteristics_no_modifiers']='No Modifiers';
	$lang['character_characteristics_might_modifiers']='Strength Modifier';
	$lang['character_characteristics_dext_modifiers']='Dexterity Modifier';
	$lang['character_characteristics_const_modifiers']='Constitution Modifier';
	$lang['character_characteristics_int_modifiers']='Intelligence Modifier';
	$lang['character_characteristics_wis_modifiers']='Wisdom Modifier';
	$lang['character_characteristics_cha_modifiers']='Charm Modifier';
	$lang['character_age']='Character Age:';
	$lang['character_age_old1']='%s Year Old';
	$lang['character_age_old2']='%s Years Old';
	$lang['character_new_bio']='Biography';
	$lang['character_new_bio_explain']='Here you can enter the story behind your character';
	$lang['character_new_step2']='Continue';
	$lang['character_new_step4']='Finish';
	$lang['character_new_class']='Choice of class';
	$lang['character_must_select_class']='You must choose a class';
	$lang['character_success']='Your character has been successfully created';
	$lang['character_impossible']='Your current characteristics forbid you access to all the classes. Please make a new character';
	$lang['character_twice']='You can not create more than one character';
	$lang['character_same_name_creation']='Your chosen character name has already been taken!';
	$lang['level_up']='Level Up!';
	$lang['level_up_select']='Select the characteristic you wish to upgrade';
	$lang['level_up_perform']='Upgrade';
	$lang['level_up_congrats']='Congratulations! You are now level %s!';

	// Character creation
	$lang['races_bonus_might']='Strength Bonus';
	$lang['races_bonus_dext']='Dexterity Bonus';
	$lang['races_bonus_const']='Constitution Bonus';
	$lang['races_bonus_int']='Intelligence Bonus';
	$lang['races_bonus_wis']='Wisdom Bonus';
	$lang['races_bonus_cha']='Charm Bonus';
	$lang['races_bonus_ma']='Magic Attack Bonus';
	$lang['races_bonus_md']='Magic Resistance Bonus';
	$lang['races_malus_ma']='Magic Attack Penalty';
	$lang['races_malus_md']='Magic Resistance Penalty';
	$lang['races_malus_might']='Strength Penalty';
	$lang['races_malus_dext']='Dexterity Penalty';
	$lang['races_malus_const']='Constitution Penalty';
	$lang['races_malus_int']='Intelligence Penalty';
	$lang['races_malus_wis']='Wisdom Penalty';
	$lang['races_malus_cha']='Charm Penalty';
	$lang['races_bonus_mining']='Bonus to the Mining Skill';
	$lang['races_bonus_stone']='Bonus to the skill Stone Cutting';
	$lang['races_bonus_forge']='Bonus to the skill Forge';
	$lang['races_bonus_enchant']='Bonus to the skill Enchantment';
	$lang['races_bonus_trading']='Bonus to the skill Trading';
	$lang['races_bonus_thief']='Bonus to the skill Theft';
	$lang['classes_base_hp']='Base hit points';
	$lang['classes_base_mp']='Base magic points';
	$lang['classes_base_ac']='Base armour class points';
	$lang['classes_update_hp']='Hit points earned at each level up';
	$lang['classes_update_mp']='Magic points earned at each level up';
	$lang['classes_update_ac']='Armour class points earned at each level up';

	// Main character page
	$lang['character_of']='%s\'s Character';
	$lang['character']='Character';
	$lang['character_class']='Class';
	$lang['character_race']='Race';
	$lang['character_element']='Element';
	$lang['character_alignment']='Alignment';
	$lang['character_health']='Health Points:';
	$lang['character_magic']='Mana Points:';
	$lang['character_experience']='Experience:';	
	$lang['character_weight']='Weight';
	$lang['character_overweight_error']='You are currently over encumbered!';
	$lang['mining']='Mining';
	$lang['stone']='Stone cutting';
	$lang['forge']='Forge';
	$lang['enchantment']='Enchantment';
	$lang['trading']='Trading';
	$lang['thief']='Theft';
	$lang['character_skills']='Skills';
	$lang['character_skills_pay']='Skills & Characteristic Upgrades';
	$lang['character_sp_skills']='Choose payment method for Skill upgrades';
	$lang['character_sp_character']='Choose payment method for Characteristic upgrades';
	$lang['sp']='Spirit Points (SP)';
	$lang['character_level']='Level';
	$lang['character_progress']='Progress';	
	$lang['character_delete']='Delete Current Character';
	$lang['character_delete_confirm']='Are you sure you really want to delete your character?';
	$lang['no_access']='You are not authorised to access this page';
	$lang['character_successful_deleted']='Your character has been deleted';
	$lang['character_active_loan']='You cannot delete your character with an outstanding Vault loan active';
	$lang['character_edit']='Update Character Biography';
	$lang['character_bio_updated']='Your biography has been successfully edited';

	// Language keys for races , classes , skills , elements and alignments
	// Classes
	/*
	$lang['class_fighter']='Fighter';
	$lang['class_fighter_desc']='The basic fighter';
	$lang['class_barbare']='Barbarian';
	$lang['class_barbare_desc']='Bloody warrior';
	$lang['class_druid']='Druid';
	$lang['class_druid_desc']='Nature\'s protector';
	$lang['class_bard']='Bard';
	$lang['class_bard_desc']='Musician, thief and fighter';
	$lang['class_magician']='Magician';
	$lang['class_magician_desc']='Spell user';
	$lang['class_monk']='Monk';
	$lang['class_monk_desc']='Hand to hand warrior';
	$lang['class_paladin']='Paladin';
	$lang['class_paladin_desc']='Holy fighter';
	$lang['class_priest']='Priest';
	$lang['class_priest_desc']='Defender of his God';
	$lang['class_sorceror']='Archmage';
	$lang['class_sorceror_desc']='Very powerful sorcerer';
	$lang['class_thief']='Thief';
	$lang['class_thief_desc']='Thief';

	// Elements
	$lang['element_water']='Water';
	$lang['element_water_desc']='Element water';
	$lang['element_earth']='Earth';
	$lang['element_earth_desc']='Element earth';
	$lang['element_holy']='Holy';
	$lang['element_holy_desc']='Element holy';
	$lang['element_fire']='Fire';
	$lang['element_fire_desc']='Element fire';
	$lang['element_ice']='Ice';
	$lang['element_ice_desc']='Element ice';
	$lang['element_wind']='Wind';
	$lang['element_wind_desc']='Element wind';

	// Alignments
	$lang['alignment_neutral']='Neutral';
	$lang['alignment_neutral_desc']='Alignment neutral';
	$lang['alignment_evil']='Evil';
	$lang['alignment_evil_desc']='Alignment evil';
	$lang['alignment_good']='Good';
	$lang['alignment_good_desc']='Alignment good';

	// Races
	$lang['race_human']='Human';
	$lang['race_human_desc']='The most common race';
	$lang['race_half-orc']='Half Orc';
	$lang['race_half-orc_desc']='Race half-Orc';
	$lang['race_half-elf']='Half Elf';
	$lang['race_half-elf_desc']='Race half-Elf';
	$lang['race_dwarf']='Dwarf';
	$lang['race_dwarf_desc']='Race Dwarf';
	$lang['race_gnome']='Gnome';
	$lang['race_gnome_desc']='Race Gnome';
	$lang['race_elf']='Elf';
	$lang['race_elf_desc']='Race Elf';
	$lang['race_halfeling']='Hobbit';
	$lang['race_halfeling_desc']='Race Hobbit';*/

	$lang['character_battle_history_monsters']='View Monster Arena Battle History';
	$lang['character_battle_history_players']='View PvP Arena Battle History';
	$lang['pvp_player_name']='Opponent\'s name';
	$lang['pvp_player_level']='Opponent\'s level';
	$lang['pvp_result']='Result';
	$lang['pvp_stopped_current']='%s abandoned battle';
	$lang['pvp_flee_current']='%s fled battle';
	$lang['pvp_victory_current']='%s was Victorious';

	$lang['give_item_subject']='You have received a gift from %s';
	$lang['give_item_msg']='You have received a %s from the member %s';
	$lang['seller_item_subject']='[RPG] Latest transaction from your store';
	$lang['seller_item_msg']='%s has purchased the following from your store to the total price of %s %s: %s%s%s.';
	$lang['general_pref']='General';
	$lang['general_give_item_pref']='Enable notification of gifts received';
	$lang['general_seller_item_pref']='Enable notification of items sold in personal shop';

	// new viewprofile keys
    $lang['count_items_warehouse']='Warehouse';
    $lang['vital_stats']='Vital Stats';
    $lang['character_chars_infos']='Characteristics';
    $lang['character_chars_points']='Currency Info';
}

if ( defined ( 'IN_SHOPS' ))
{
	$lang['shops_categories_item_name']='Item Name';
	$lang['shops_categories_item_desc']='Item Description';
	$lang['items_none']='No items';
	$lang['items_give']='Give';
	$lang['items_sell']='Sell';
   	$lang['Dispose']='Delete';
	$lang['items_buy']='Buy';
	$lang['items_steal']='Steal';
	$lang['items_action']='Action';
	$lang['forum_shops_go']='General Stores';
	$lang['users_shops_list']='The Blackmarket';
	$lang['items_search']='Item Search';
	$lang['users_shops_create']='Create a shop';
	$lang['users_shops_create_success']='Your shop has been created successfully';
	$lang['users_shops_edited_success']='Your shop has been edited successfully';
	$lang['users_shops_create_name']='Name of your shop';
	$lang['users_shops_create_desc']='Description of your shop';
	$lang['users_shops_create_price']='In order to create you shop, you have to pay the sum of %s %s';
	$lang['users_shops_manage']='Manage My Store';
	$lang['users_shops_already']='You can not create more than one shop at any one time';
	$lang['shop_forums']='Forum shop';
	$lang['shop_forums_desc']='All the existing items!';
	$lang['lack_items']='This item is not for sale';
	$lang['lack_shops']='You first have to create a shop';
	$lang['buy_item_success']='Items bought successfully for %s %s';
	$lang['steal_item_success']='Item successfully stolen!';
	$lang['steal_item_failure']='You have not managed to steal this item';
	$lang['steal_item_failure_suite']='You had to pay a fine of %s %s for attempted theft';
	$lang['steal_item_forbidden']='Theft is forbidden';
	$lang['items_into_shop']='Put up for sale';
	$lang['items_into_inventory']='Retrieve';
	$lang['items_edit']='Edit';
	$lang['items_copy']='Copy';
	$lang['items_edition']='Edit of the item <b>%s</b>';
	$lang['inventory_items_successful_edited']='Item successfully edited';
	$lang['inventory_items_successful_added']='Items successfully added to your shop';
	$lang['items_donation']='Gift of the items <b>%s</b>';
	$lang['items_give_to']='Give to:';
	$lang['give_item_success']='Items successfully given';
	$lang['shop_items_successful_removed']='These items have been placed into your inventory';
	$lang['shop_items_successful_deleted']='These items have been deleted';
	$lang['inventory_items_successful_selled']='These items have been sold';
	$lang['shop_items_failure_deleted']='This item does not exist';
	$lang['users_shops_edit']='Update your shop information';
	$lang['users_shops_delete']='Close your shop';
	$lang['users_shops_deleted']='Your shop has been closed';
	$lang['shop_name']='Shop\'s Name';
	$lang['shop_desc']='Shop\'s Description';
	$lang['shops_update_date']='Last updated';
	$lang['users_shops_owner']='Store owner';
	$lang['shop_owner_name']='Owner';
    $lang['shops_update_never']='n/a';
	$lang['battle_no_delete_items']='You cannot delete and item from your inventory while in an active monster battle!';
	$lang['battle_no_give_items']='You cannot donate an item while in an active monster battle!';
	$lang['battle_no_give_items_2']='You cannot donate an item to this user at the moment because they\'re in an active monster battle!';
	$lang['battle_no_sell_items']='You cannot sell items while in an active monster battle!';
	$lang['battle_no_move_to_shop']='You cannot move an item from you inventory to personal store while in an active monster battle!';
	$lang['dont_care']='I do not care';
	$lang['items_type_least']='Minimum quality value:';
	$lang['items_power_least']='Minimum power value:';
	$lang['items_level_least']='Minimum level value:';
	$lang['items_duration_least']='Minimum duration value:';
	$lang['items_price_max']='Maximum price:';
	$lang['items_search_criteria']='Research criteria';
	$lang['search_no_results']='No item match your criteria';
	$lang['items_sell_confirm']='Item sale';
	$lang['items_sell_confirm_price']='Do you want to sell these items for %s %s?'; 
	$lang['shops_item_weight']='Item Weight';
	$lang['shops_item_element']='Item Element:';
	$lang['lack_warehouse']='You need to open a Warehouse account first'; 
	$lang['warehouse_items_fail']='Failed to add to Warehouse'; 
	$lang['warehouse_items_successful_added']='Successfully moved item(s) to Warehouse'; 
	$lang['users_warehouse_close']='Close Warehouse';
	$lang['users_warehouse_deleted']='Warehouse successfully closed';
	$lang['items_into_warehouse']='Move to Warehouse';
	$lang['admin_move_success']='Successfully moved admin only item from admin shop to your inventory';
	$lang['admin_only_area']='This is an administrator only area!<br /><br />This action has been reported to the forum administrator';

	// Items type
	$lang['items_type_use']='Item type';
	$lang['items_type_raw_materials']='Raw material';
	$lang['items_type_rare_raw_materials']='Rare raw material';
	$lang['items_type_tools_pickaxe']='Pickaxe';
	$lang['items_type_tools_magictome']='Magic tome';
	$lang['items_type_weapon']='Weapon';
	$lang['items_type_enchanted_weapon']='Magic weapon';
	$lang['items_type_armor']='Armor';
	$lang['items_type_buckler']='Shield';
	$lang['items_type_helm']='Helm';
	$lang['items_type_gloves']='Gloves';
	$lang['items_type_magic_attack']='Offensive spell';
	$lang['items_type_magic_defend']='Defensive spell';
	$lang['items_type_amulet']='Amulet';
	$lang['items_type_ring']='Ring';
	$lang['items_type_health_potion']='Health Potion';
	$lang['items_type_mana_potion']='Mana Potion';
	$lang['items_type_misc']='Miscellaneous';

	//Shops
	$lang['items_quality']='Quality';
	$lang['items_power']='Power';
	$lang['items_level']='Level';
	$lang['items_enhancements']='Armour, Weapon & Magic Spell Enhancements';
	$lang['items_dex']='Additional Power Modifier:';
	$lang['items_mp_use']='Additional MP Cost:';
	$lang['shops_categories_item_add_power']='Additional Power: +';
	$lang['shops_categories_item_mp_use']='Additional MP Cost: -';
	$lang['items_duration']='Duration';
	$lang['items_price']='Price';
	$lang['items_quality_very_poor']='Very poor';
	$lang['items_quality_poor']='Poor';
	$lang['items_quality_medium']='Medium';
	$lang['items_quality_good']='Good';
	$lang['items_quality_very_good']='Very good';
	$lang['items_quality_excellent']='Exceptional';
	$lang['shops_item_add']='Add an item';
	$lang['store_name']='Store Name:';
	$lang['store_desc']='Description:';
	$lang['store_img']='Logo:';
	$lang['store_status']='Status:';
	$lang['store_open']='Open';
	$lang['store_sale']='Store Sale!';
	$lang['store_closed']='Closed';
	$lang['store_admin']='Admin Only';
	$lang['store_closed_msg']='Sorry, but this store is currently closed for business.<br /><br />Please try again later.';
	$lang['store_item']=' Information';
	$lang['store_quality']='Quality:';
	$lang['store_power']='Power:';
	$lang['store_level']='Level:';
	$lang['store_duration']='Duration:';
	$lang['store_price']='Price:';
	$lang['store_weight']='Weight:';
	$lang['store_element']='Element:';
	$lang['store_element_none']='None';
	$lang['store_not_stealable']='This item cannot be stolen';

	//Items
	$lang['item_ore']='Rock';
	$lang['item_ore_desc']='A small rock';
	$lang['items_sapphire']='Sapphire';
	$lang['items_sapphire_desc']='Precious stone';
	$lang['items_diamond']='Diamond';
	$lang['items_diamond_desc']='Precious stone';
	$lang['item_tome']='Magic tome';
	$lang['item_tome_desc']='Needed to enchant items and use spells';
	$lang['items_miner']='Pickaxe';
	$lang['items_miner_desc']='Required for mining';
	$lang['items_scroll_1']='Fireball';
	$lang['items_scroll_1_desc']='Offensive spell parchment';
	$lang['items_scroll_2']='Iceball';
	$lang['items_scroll_2_desc']='Offensive spell parchment';
	$lang['items_scroll_3']='Armor';
	$lang['items_scroll_3_desc']='Defensive spell parchment';
	$lang['items_scroll_4']='Shadow Armour';
	$lang['items_scroll_4_desc']='Defensive spell parchment';
	$lang['items_ring_1']='Ring of might';
	$lang['items_ring_1_desc']='Attacks the enemy with a small discharge of energy';
	$lang['items_ring_2']='Supreme ring of might';
	$lang['items_ring_2_desc']='Attacks the enemy with a big discharge of energy';
	$lang['items_amulet_1']='Amulet of protection';
	$lang['items_amulet_1_desc']='Protects the owner';
	$lang['items_amulet_2']='Supreme amulet of protection';
	$lang['items_amulet_2_desc']='Protects the owner';

	// Steal item keys
	$lang['steal_item_failure_critical_all_sentence']='Theft attempt!';
	$lang['steal_item_failure_critical']='You have been caught by the shop owner trying to steal a %s%s%s. Since you do not have enough money to pay the fine, you will be imprisoned.';
	$lang['steal_item_failure_critical_all']='During this period, you cannot access the forums.';
	$lang['steal_item_failure_critical_post']='During this period, you cannot post new messages.';
	$lang['steal_item_failure_critical_read']='During this period, you cannot read or post messages.';

	// Warehouse keys
	$lang['warehouse_own']='Personal Warehouse';
	$lang['warehouse_s']='\'s';
	$lang['warehouse_name']=' Warehouse';
	$lang['warehouse_none']='You currently do not have an open Warehouse';
	$lang['warehouse_open']='Open Warehouse';
	$lang['warehouse_opened']='You have successfully opened a Warehouse';
	$lang['warehouse_items_successful_removed']='You have successfully moved the item(s) from your Warehouse to your inventory';

	$lang['check_all']='Check all';
	$lang['uncheck_all']='Uncheck all';
	$lang['forge_broken']='This item cannot be used';
	$lang['forge_max_skill']='This weapon has reached its maximum enhanced power limit and can no longer be upgraded.';
	$lang['forge_repair_broken_definitive']='This cannot be repaired';
	$lang['forge_enchant_broken_definitive']='This cannot be recharged';
	$lang['delete_used_items']='Delete the irreparable items';
	$lang['character_prefs_items_deleted']='Irreparable items deleted';
	$lang['trading_limit']='You have used up your trading quota for today';
	$lang['thief_limit']='You have used up your thief use quota for today';

	$lang['steal_none']='Not Stealable';
	$lang['steal_very_easy']='Very Easy';
	$lang['steal_easy']='Easy';
	$lang['steal_average']='Average';
	$lang['steal_tough']='Tough';
	$lang['steal_challenging']='Challenging';
	$lang['steal_formidable']='Formidable';
	$lang['steal_heroic']='Heroic';
	$lang['steal_impossible']='Near Impossible';
	$lang['items_steal_dc']='Steal Chance (dc):';
}

if ( defined ('IN_VAULT'))
{
	$lang['vault_exchange_actions']='Available stocks';
	$lang['vault_interests_rate']='Interests rate';
	$lang['vault_interests_time']='Interest Time';
	$lang['vault_closed']='The vault is currently closed. <br /> Please try again later';
	$lang['vault_user_points']='In hand';
	$lang['vault_no_account']='You do not have an account here';
	$lang['vault_open_account']='Open an account';
	$lang['vault_account_opened']='You now have an account. Thank you for your confidence in us';
	$lang['vault_account']='Personal account';
	$lang['vault_close_account']='Close Personal Account';
	$lang['vault_account_closed']='Your account has been closed';
	$lang['vault_user_informations']='Personal Information';
	$lang['vault_opened_accounts']='Open accounts';
	$lang['vault_accounts_sum']='Total possessions';
	$lang['vault_account_informations']='Deposit and Withdraw';
	$lang['vault_account_deposit']='Deposit into your account';
	$lang['vault_deposit']='Deposit';
	$lang['vault_account_withdraw']='Withdraw from your account';
	$lang['vault_withdraw']='Withdraw';
	$lang['vault_deposit_lack']='You do not own that many points';
	$lang['vault_withdraw_lack']='You can not withdraw that amount from your account';
	$lang['vault_account_ok']='The requested operations were made on your account';
	$lang['vault_loan_informations']='Loans';
	$lang['vault_loan_no_explain']='In order to request a loan, you must have at least';
	$lang['vault_loan_rate']='Loan interests rate';
	$lang['vault_loan_time']='Maximum duration of repayment';
	$lang['vault_loan_max_sum']='Maximum sum you can borrow';
	$lang['vault_loan_make']='Take out a loan';
	$lang['vault_loan_action']='Request loan';
	$lang['vault_loan_no_double']='You can not have two loans at the same time. Please first pay back the first loan';
	$lang['vault_loan_no_such']='You can not borrow that much';
	$lang['vault_loan_ok']='You have borrowed the sum of ';
	$lang['vault_loan_sum']='Borrowed amount';
	$lang['vault_loan_remaining_time']='Term';
	$lang['vault_loan_remaining_date']='Corresponds to the';
	$lang['vault_loan_loan']='The sum to be paid off';
	$lang['vault_loan_back']='Pay off the loan';
	$lang['vault_loan_active']='You have made a loan';
	$lang['vault_loan_lack_points']='You do not have enough to pay off your loan';
	$lang['vault_loan_pay_off_ok']='Thank you for paying off your loan before the end of the agreed term';
	$lang['vault_others']='Miscellanous';
	$lang['vault_preferences']='Preferences';
	$lang['vault_list']='Account owners list';
	$lang['vault_stock_exchange']='Stock Exchange';
	$lang['vault_exchange_previous_price']='Previous';
	$lang['vault_exchange_worst_price']='Lowest';
	$lang['vault_exchange_best_price']='Highest';
	$lang['vault_exchange_owned']='Owned';
	$lang['vault_exchange_buy']='Buy';
	$lang['vault_exchange_sell']='Sell';
	$lang['vault_exchange_none']='None';
	$lang['vault_loan_none']='None';
	$lang['vault_stock_lack']='You can not sell more stocks than you currently own';
	$lang['vault_points_lack']='You do not have enough money to perform the requested actions';
	$lang['vault_blacklist']='Your account has been frozen';
	$lang['vault_blacklist_explain']='This is due to your delay in the repayment conditions of the loan to which you agreed. We now have the legal right to freeze your account. <br /> It will be accessible to you after the repayment of the loan and interest for the delay.';
	$lang['vault_blacklist_due']='You owe us the sum of ';
	$lang['vault_blacklist_due_payoff']='Pay off the loan and the delay fines ';
	$lang['vault_due_ok']='Thank you for your full repayment. Please make sure that this does not happen again.';
	$lang['vault_pref_account_protect']='Hide the sum in my account from others users';
	$lang['vault_pref_loan_protect']='Hide the amount of my loan to others users';
	$lang['vault_not_available']='Vault preferences only available when you have an active Vault account.';
	$lang['vault_account_amount']='Capital';
	$lang['vault_loan_amount']='Loan';
	$lang['vault_confidential']='Hidden';
	$lang['vault_cheater']='Your attempt to use an old Vault exploit for infinate money has been recorded and info sent to the forum administrator';
  	$lang['vault_exchange_actions_amount']='Current';
   	$lang['vault_exchange_actions_name']='Stock';
   	$lang['vault__page_name']='Vault';
   	$lang['Username']='Member';
   	$lang['Profile']='Profile';

	// Fields language keys - Glory to Ptirhiik !
	$lang['vault_language_key']='You can enter text or a language key (please refer to language/lang_<i>your_language</i>/lang_main.php)';
	$lang['vault_action_name_1']='Railroad Company';
	$lang['vault_action_name_2']='The great Dwarf';
	$lang['vault_action_name_3']='Rabbit Inc.';
	$lang['vault_action_desc_1']='Society founded in 1859';
	$lang['vault_action_desc_2']='Society of treatment of metals';
	$lang['vault_action_desc_3']='The rabbits paradise';
}

if ( defined ('IN_BATTLE'))
{
	$lang['battle_equipment']='Equip Prior to Battle';
	$lang['battle_select_armor']='Select Armour:';
	$lang['battle_select_buckler']='Select a Shield:';
	$lang['battle_select_helm']='Select a Helm:';
	$lang['battle_select_gloves']='Select Gloves:';
	$lang['battle_select_amulet']='Select an Amulet:';
	$lang['battle_select_ring']='Select a Ring:';
	$lang['battle_no_armor']='No Armour';
	$lang['battle_no_buckler']='No Shield';
	$lang['battle_no_helm']='No Helm';
	$lang['battle_no_gloves']='No Gloves';
	$lang['battle_no_amulet']='No Amulet';
	$lang['battle_no_ring']='No Ring';
	$lang['battle_fight']='Begin Battle';
	$lang['no_monsters']='No monster corresponds to your level. <br /><br />Please speak to your forum administrator.';
	$lang['attack']='Attack Power';
	$lang['defense']='Defence Power';
	$lang['attack_opponent']='Attack';
	$lang['defend_opponent']='Defend';
	$lang['flee_opponent']='Flee';
	$lang['spell_opponent']='Use a Magic Item';
	$lang['actions_opponent']='Actions';
	$lang['potion_opponent']='Use a Potion';
	$lang['battle_no_weapon']='Bare Fists';
	$lang['battle_no_spell']='No Magic Item';
	$lang['battle_no_potion']='No Potion';
	$lang['battle_critical_hit']='Critical Hit!';
	$lang['battle_won']='You inflict a death blow of %s damage and leave victorious from the battle! You earn %s experience, %s Spirit Points (SP) and %s %s';
	$lang['battle_pvp_won']='You inflict a death blow of %s damage and leave victorious from the battle! You earn %s experience and %s %s';
	$lang['battle_stolen_items']='You recover your stolen items from %s\'s dead corpse';
	$lang['battle_stolen_items_lost']='%s runs off with your stolen goods!';
	$lang['battle_return']='Click %shere%s to fight again';
	$lang['battle_regen_xp']='%s regenerates %s HP!';
	$lang['battle_regen_mp']='%s regenerates %s MP!';
	$lang['battle_regen_both']='%s regenerates %s HP & %s MP!';
	$lang['battle_lost']='%s inflicts a death blow of %s damage...you fall lifeless to the ground.';
	$lang['battle_double_ko']='You and %s inflict death blows upon one another...both falling lifeless to the ground.';
	$lang['battle_pvp_lost']='Your opponent inflicts a death blow of %s damage...you fall lifeless to the ground.';
	$lang['battle_temple']='Click %shere%s to go to the temple'; 
	$lang['character_return']='Click %shere%s to return to your Character Sheet.';
	$lang['pvp_return']='Click %shere%s to return to your PvP list page.';
	$lang['battle_character_dead']='You can not fight if you\'re not alive!';
	$lang['battle_flee']='%s flees from battle!';
	$lang['battle_opponent_thief_success']='%s successfully steals a %s from %s!';
	$lang['battle_opponent_thief_failure']='%s attempts to steal a %s from %s but fails!';
	$lang['battle_opponent_thief_points']='%s successfully steals %s %s from %s\'s pocket!';
	$lang['battle_spell_monster_str_success']='%s casts a powerful elemental spell inflicting %s damage upon %s!';
	$lang['battle_spell_monster_same_success']='%s casts an elemental spell conflicting with %s\'s element inflicting %s damage!';
	$lang['battle_spell_monster_weak_success']='%s casts a weak elemental spell inflicting %s damage upon %s!';
	$lang['battle_opponent_attack_success']='%s strikes %s inflicting %s damage!';
	$lang['battle_opponent_spell_success2']='%s casts a spell upon %s inflicting %s damage!';
	$lang['battle_opponent_spell_success']='%s casts %s upon %s inflicting %s damage!';
	$lang['battle_opponent_spell_failure']='%s attempts to cast a spell upon %s, but fails!';
	$lang['battle_opponent_attack_failure']='%s did not manage to deal any damage upon %s!';
	$lang['battle_opponent_crit']='%s deals a critical hit!';

	$lang['battle_spell_success']='%s casts %s [%s element] inflicting %s damage upon %s!';
	$lang['battle_spell_success_norm']='%s casts %s inflicting %s damage upon %s!';
	$lang['battle_spell_oppose_str_success']='%s casts %s [powerful element] inflicting %s damage upon %s!';
	$lang['battle_spell_oppose_same_success']='%s casts %s [conflicting element] upon %s inflicting %s damage!';
	$lang['battle_spell_oppose_weak_success']='%s casts %s [weak element] upon %s inflicting %s damage!';
	$lang['battle_spell_failure']='%s attempts to cast %s upon %s but fails!';
	$lang['battle_spell_defensive_success']='%s casts %s increasing his physical attack and defence by %s!';
	$lang['battle_spell_dura']='%s\'s spell, %s, has run out of charge and is no longer usable!';
	$lang['battle_spell_dura_fail']='Your spell has run out of charge and is no longer usable!';
	$lang['battle_spell_def_dura']='%s\'s %s spell has run out of charge and is no longer usable!';
	$lang['battle_potion_hp_success']='%s consumes a %s restoring %s HP!';
	$lang['battle_potion_hp_success_none']='%s attempts to consume a %s but is already at max HP!';
	$lang['battle_potion_hp_dura_none']='%s discards the %s.';
	$lang['battle_potion_mp_success']='%s consumes a %s restoring %s MP!';
	$lang['battle_potion_mp_success_none']='%s attempts to consume a %s but is already at max MP!';
	$lang['battle_attack_success']='%s strikes %s with a %s [%s element] inflicting %s damage!';
	$lang['battle_attack_success_norm']='%s strikes %s with a %s inflicting %s damage!';
	$lang['battle_attack_weap_str']='%s strikes %s with a %s [powerful elemental weapon] inflicting %s damage!';
	$lang['battle_attack_weap_same']='%s strikes %s with a %s [conflicting element] inflicting %s damage!';
	$lang['battle_attack_weap_weak']='%s strikes %s with a %s [weak element] inflicting %s damage!';
	$lang['battle_attack_dura']='%s\'s %s has broken and is discarded!';
	$lang['battle_attack_failure']='%s attempts to strike %s with a %s but misses the attack!';
	$lang['battle_attack_bare']='%s inflicts %s damage upon %s with his bare fists!';
	$lang['battle_attack_bare_fail']='%s attempts to strike %s with his bare fists but misses!';
	$lang['battle_flee_fail']='%s attempts to flee from battle but fails!';
	$lang['battle_defend']='%s defends against %s attack!';
	$lang['battle_check']='Incorrect MP cost check. Please contact your ADR administrator';
	$lang['battle_msg_check']='\'s turn';
	$lang['battle_msg_monster_start']='gains the initiative & begins the battle!';

	$lang['character_battle_statistics']='Battle Statistics';
	$lang['character_victories']='Victories';
	$lang['character_defeats']='Defeats';
	$lang['character_flees']='Flees';
	$lang['character_double_ko']='Double KO\'s';
	$lang['character_battle_skills']='Battle & Skill Limits';
	$lang['character_battle_limit']='Monster Arena Battles Remaining:';
	$lang['character_skill_limit']='Skill Use Remaining:';
	$lang['character_trading_limit']='Trading Skill Remaining:';
	$lang['character_thief_limit']='Theft Skill Remaining:';
	$lang['character_battle_history']='View battle history';
	$lang['battle_result']='Battle result';
	$lang['battle_result_victory']='Victory';
	$lang['battle_result_defeat']='Defeat';
	$lang['battle_result_flee']='Escape';
	$lang['battle_result_double_ko']='Double KO!';
	$lang['battle_monster_name']='Monster\'s name';
	$lang['battle_monster_level']='Monster\'s level';
	$lang['battle_disabled']='The battle system is unavailable at the moment. Please try again later';
	$lang['battle_over_weight'] = 'You are currently over-weight<br /><br />You need to off load some items before you can battle';
	$lang['battle_limit']='You have used up your battle quota for today';
	$lang['battle_force_lvl_up']='You need to level your character up before being able to battle again.';

	//Graphical battles keys
	$lang['battle_attributes']='Attributes';
	$lang['battle_phy_att']='Melee Att';
	$lang['battle_phy_def']='Melee Def';
	$lang['battle_mag_att']='Magic Att';
	$lang['battle_mag_def']='Magic Def';
	$lang['battle_alignment']='Alignment';
	$lang['battle_element']='Element';
	$lang['battle_class']='Class';

	// Battle community keys
    $lang['shoutbox_community']='Community';
    $lang['shoubox_online_list']='Active Online Characters';
    $lang['shoutbox_enter']='Type Message';
    $lang['shoutbox_shout']='Shout!';
    $lang['community_no_users_online']='No other characters currently online.';

	// Shoutbox keys
	$lang['global_shout_adm_cmd']='[Admin Command]';
	$lang['global_shout_vitals']='<b>%s</b> Stats: HP: %s/%s, MP: %s/%s';
	$lang['global_shout_error_1']='You need to add text before posting!';
	$lang['global_shout_error_2']='Sorry, you exceeded the max characters allowed for a single post.';
	$lang['global_shout_error_3']='You have not entered the correct format for this admin command. Please refer to the administrator command notes for more details.';
	$lang['global_shout_error_no_log']='No one has started a chat session today';
	$lang['global_shout_announcer']='Global Announcer';
	$lang['global_shout_killme']='<b>%s</b> attempts to kill themselves with a %s';
	$lang['global_shout_incorrect_user']='The username: <b>%s</b> was not recognised to complete this action.';
	$lang['global_shout_kill_yes']='The user: <b>%s</b> has been successfully killed';
	$lang['global_shout_kill_already']='The user: <b>%s</b> is already dead.';
	$lang['global_shout_endmon_yes']='The monster battle for the user: <b>%s</b> has been successfully cancelled.';
	$lang['global_shout_endmon_none']='There were no active monster battles found for the user: <b>%s</b>';
	$lang['global_shout_ban_yes']='The user: <b>%s</b> has been banned from participating in the RPG.';
	$lang['global_shout_ban_already']='The user: <b>%s</b> is already serving an ADR ban.';
	$lang['global_shout_unban_yes']='The user: <b>%s</b> has been successfully un-banned from the RPG.';
	$lang['global_shout_unban_already']='The user: <b>%s</b> is NOT currently serving a ban at the moment.';
	$lang['global_shout_endallpvp_yes']='All PvP battles have successfully ended for the user: <b>%s</b>';
	$lang['global_shout_endallpvp_none']='The user: <b>%s</b> has no outstanding PvP battles.';
	$lang['global_shout_revive_yes']='The user: <b>%s</b> has been successfully revived.';
	$lang['global_shout_revive_already']='The user: <b>%s</b> is currently alive and does not need to be revived.';
	$lang['global_shout_ban_pm']='You have been banned from playing the RPG';
	$lang['global_shout_unban_pm']='You have been un-banned from playing the RPG';
	$lang['global_shout_pvpme']='%s: PvP me!!';
	$lang['global_shout_endpvp_yes']='The PvP match between <b>%s</b> and <b>%s</b> has been cancelled.';
	$lang['global_shout_endpvp_none']='No PvP match found with the battle id of <b>%s</b>.';
	$lang['global_shout_realname']='%s %s\'s real name is %s. %s';
}

if ( defined ('IN_TEMPLE'))
{
	$lang['temple_settings_explain']='Here you can manage the options of the temple';
	$lang['temple_heal_cost']='Cost to fully heal a character (by level)';
	$lang['temple_resurrect_cost']='Cost to resurrect a character (by level)';
	$lang['battle_progress']='You first have to end your current battle.';
	$lang['temple_heal_cost']='Heal cost';
	$lang['temple_resurrect_cost']='Resurrection cost';
	$lang['temple_heal']='Healing Light';
	$lang['temple_resurrect']='Resurrect';
	$lang['temple']='Temple';
	$lang['temple_resurrect_instead']='You need to resurrect your character, not simply heal!';
	$lang['temple_heal_not']='You do not need to be healed';
	$lang['temple_heal_instead']='You do not need to be resurrected';
	$lang['temple_healed']='You are now fully healed and ready for battle.';
	$lang['temple_resurrected']='You have been revived!';
}

if ( defined ('IN_CELL'))
{
	$lang['cell_admin_title_explain']='Here you can imprison or free your users, define their prison sentence or amend their pledge amount';
	$lang['cell_admin_select_user']='Select a user to imprison';
	$lang['cell_admin_select']='Imprison this user';
	$lang['cell_admin_time']='Prison sentence';
	$lang['cell_admin_time_explain']='Theses values represent the time during which the user will not be authorised to access the forums';
	$lang['cell_admin_caution']='Pledge amount';
	$lang['cell_admin_caution_explain']='This is the amount of points the user has to pay to be freed. Set to 0 if you do not want to use this feature or if you do not use a point system on your forums';
	$lang['cell_admin_celled_ok']='The selected user has been successfully imprisoned';
	$lang['cell_admin_uncelled_ok']='The selected users have been successfully released';
	$lang['cell_admin_celled_users']='Imprisoned users';
	$lang['cell_admin_celled_name']='Name';
	$lang['cell_admin_celled_caution']='Pledge';
	$lang['cell_admin_celled_time']='Remaining time';
	$lang['cell_admin_celled_free']='Free';
	$lang['cell_admin_manual_update']='Update the prison sentences';
	$lang['cell_admin_manual_update_explain']='The update of the sentences is made while imprisoned users are connected to your forums. If a user has not come to your forums in a while, the values you see may be incorrect. Click on this button to correct this problem.';
	$lang['cell_admin_celled_manual_update_ok']='Update of the prison sentences made successfully. The following users have been freed:<br />';
	$lang['cell_sentence_example']='You have been imprisoned because of offensive language';
	$lang['cell_sentence']='Sentence';
	$lang['cell_sentence_explain']='This text will explain the detention reason to the user';
	$lang['cell_title']='Detention';
	$lang['cell_explain']='A site admin has imprisoned you. This will last';
	$lang['cell_time_explain']='Until this time, you will not be able to access these forums';
	$lang['cell_caution']='It is possible for you to be released from prison by paying a pledge to the sum of ';
	$lang['cell_caution_pay']='Pay the pledge';
	$lang['cell_free']='You have now been released from prison. Be careful not to return to it. <br /><br />Click <a href="'.append_sid("index.php").'">here</a> to go the forums index';
	$lang['cell_celled_time']='Imprisonment duration';
	$lang['cell_judge_user']='Judge this user';
	$lang['cell_judgement']='Judgement';
	$lang['cell_freeable']='Can be freed';
	$lang['cell_freeable_explain']='If you check this option, the others users will be able to judge this user'; 
	$lang['cell_cautionnable']='Pledge can be paid';
	$lang['cell_cautionnable_explain']='If you check this option, others users will be able to pay the pledge for this user';
	$lang['cell_admin_celled_users_explain']='You can edit the imprisoned users by clicking on their name';
	$lang['cell_admin_celled_edited_ok']='This user has been edited successfully';
	$lang['cell_selected_celled']='Selected user:';
	$lang['cell_judgement_none']='No users are actually imprisoned';
	$lang['cell_celled_list']='See the imprisonment history';
	$lang['cell_celled_date']='Imprisonment date';
	$lang['cell_freed_type']='Freed by';
	$lang['cell_judgement_never']='No users have been imprisoned yet';
	$lang['cell_freed_type_still']='This user is still imprisoned';
	$lang['cell_freed_type_time']='End of the detention period';
	$lang['cell_freed_type_admin']='Courthouse';
	$lang['cell_celled_list_history']='Imprisonment history';
	$lang['cell_imprisonments']='Total imprisonment';
	$lang['cell_admin_celled_blank']='Clear this users imprisonment history';
	$lang['cell_admin_celled_blank_explain']='If you check this option, this users\' imprisonment history will be deleted';
	$lang['cell_admin_update_error']='Error during the update of the jail setting';
	$lang['cell_updated_return_settings']='The jail settings have been edited successfully. <br /><br />Click %shere%s to return to the jail management'; 
	$lang['cell_settings_explain']='Here you can edit the general settings of the jail system';
	$lang['cell_settings_bars']='Display the avatar of imprisoned users behind cell bars';
	$lang['cell_settings_celleds']='Display the total imprisonment number for this user on topics and in their profile';
	$lang['cell_settings_caution']='Allow users to pay the pledge for other users';
	$lang['cell_settings_judge']='Allow users to judge other users';
	$lang['cell_settings_blank']='Allow users to clear their police record';
	$lang['cell_settings_blank_sum']='Sum to pay to clear the individuals police record';
	$lang['cell_judgement']='Judgement';
	$lang['cell_judgement_pay_sledge']='Pay the pledge';
	$lang['cell_lack_money']='You don\'t have enough points to perform this action';
	$lang['cell_sledge_paid']='This user\'s pledge has been successfully paid';
	$lang['cell_return']='Click %shere%s to return to the courthouse';
	$lang['cell_settings_voters']='Minimum number of votes in order to validate the judgement'; 
	$lang['cell_settings_posts']='Minimum number of posts the users must have to be authorised to vote';
	$lang['cell_caution_not_authed']='This user can\'t be freed by paying a pledge';
	$lang['cell_judgement_ever']='You have already judged this user';
	$lang['cell_judgement_explain']='Which is your judgement?';
	$lang['cell_judgement_guilty']='Guilty';
	$lang['cell_judgement_innocent']='Innocent';
	$lang['cell_judgement_not_authed']='You are not authorised to judge this user';
	$lang['cell_judgement_done']='Your judgement has been registered successfully';
	$lang['cell_blank_text']='You can clear your police record if you pay the sum of %s';
	$lang['cell_blank_explain']='Clear your police record';
	$lang['cell_blank_done']='Your police record have been cleared successfully';
	$lang['cell_judgement_ever_authed']='This user has been judged guilty';
	$lang['cell_admin_punishment']='Select the actions forbidden for the user:';
	$lang['cell_admin_punishment_global']='All';
	$lang['cell_admin_punishment_posts']='Post new messages';
	$lang['cell_admin_punishment_read']='Post and read messages';
	$lang['cell_punishment']='Punishment';
	$lang['cell_punishment_global']='Banned';
	$lang['cell_punishment_posts']='Cannot post new messages';
	$lang['cell_punishment_read']='Cannot read or post messages';
	$lang['cell_time_explain_posts']='Until this time, you are not allowed to post new messages';
	$lang['cell_time_explain_read']='Until this time, you are not allowed to read or post messages';
	$lang['cell_days']='days';
	$lang['cell_hours']='hours';
	$lang['cell_minutes']='minutes';
    $lang['cell_vote_only_once']='You have already submitted a vote for this sentence.';
}

if ( defined ('IN_FORGE'))
{
	$lang['forge_repair']='Repair an item';
	$lang['forge_repair_explain']='This allows you to repair item for free';
	$lang['forge_recharge']='Recharge a magic item';
	$lang['forge_recharge_explain']='This allows you to recharge magic items for free';
	$lang['forge_create']='Create a new item';
	$lang['forge_enchant']='Enchant an item';
	$lang['forge_mining']='Go mining';
	$lang['forge_mining_explain']='Digging allows you to find raw materials';
	$lang['forge_stone']='Improve raw materials';
	$lang['forge_stone_explain']='This allows you to improve the quality of your raw materials, so you can sell them for a better price';
	$lang['forge_mining_select_tool']='Select a tool';
	$lang['forge_mining_no_tool']='No tool';
	$lang['forge_mining_go']='Go mining';
	$lang['forge_mining_tool_needed']='You can\'t dig with your hands!';
	$lang['forge_mining_failure']='You found nothing';
	$lang['forge_mining_success']='You found a %s with a value of %s %s !';
	$lang['forge_repair_no_item']='No item';
	$lang['forge_repair_select_item']='Select an item to repair';
	$lang['forge_repair_go']='Repair this item';
	$lang['forge_repair_tool_needed']='You can\'t repair this item with your hands!';
	$lang['forge_repair_item_to_repair_needed']='You must select an item to be repaired';
	$lang['forge_repair_failure_critical']='What clumsiness! You have destroyed this item!';
	$lang['forge_repair_failure']='You failed to repair this item';
	$lang['forge_repair_success']='Congratulations! This item can be used %s more times';
	$lang['forge_recharge_select_item']='Select an item to recharge';
	$lang['forge_recharge_go']='Recharge';
	$lang['forge_recharge_failure']='You did not manage to recharge this item';
	$lang['forge_recharge_tool_needed']='You cannot recharge this item with your hands !';
	$lang['forge_recharge_item_to_repair_needed']='You must select an item to be recharged';
	$lang['forge_stone_select_item']='Selection a raw material';
	$lang['forge_stone_go']='Improve this raw material';
	$lang['forge_stone_tool_needed']='You need a tool to improve a raw material';
	$lang['forge_stone_item_to_repair_needed']='You must choose a raw material to be improved';
	$lang['forge_stone_failure']='You did not manage to improve this raw material';
	$lang['forge_stone_success']='Congratulations! You have managed to improve the quality of this raw material and now has a duration of %s points!';
	$lang['forge_enchant_select_tool']='Select a spell';
	$lang['forge_enchant_select_item']='Select a weapon to enchant';
	$lang['forge_enchant_go']='Enchant this item';
	$lang['forge_enchant_explain']='Enchanting an item increases its power';
	$lang['forge_enchant_no_item']='No magic item';
	$lang['forge_enchant_tool_needed']='You must choose a magic item to enchant another one';
	$lang['forge_enchant_item_to_repair_needed']='You must choose an item to enchant';
	$lang['forge_enchant_failure']='You did not manage to enchant this item';
	$lang['forge_enchant_success']='Congratulations! You have managed to increase the power of this item by %s points!';
	$lang['forge_repair_not_needed']='This item does not need to be repaired';
	$lang['forge_recharge_not_needed']='This item does not need to be recharged';
	$lang['skill_limit']='You have used up your skill use quota for today';
}

if ( defined('IN_COPYRIGHT'))
{
	$lang['Translator']='';
	$lang['copyright_translator']='Translator';
	$lang['copyright_explain']='All of them have played a high role into the creation of this system';
	$lang['copyright_images']='Images';
	$lang['copyright_thanks']='Special Thanks';
	$lang['copyright_author']='Original Author';
	$lang['copyright_new_author']='New ADR Developer (v0.30+)';
}

if ( defined('IN_TOWN'))
{
	$lang['town_training_grounds']='Training Grounds';
	$lang['town_training_grounds_train_skill']='Train a Skill';
	$lang['town_training_grounds_train_charac']='Train a Characteristic';
	$lang['town_training_grounds_train_upgrade']='Promotion';
	$lang['town_training_grounds_change_class']='Change Class';
	$lang['town_training_grounds_train_upgrade_lack_class']='There is no promotion are available for your current class and characteristics';
	$lang['town_training_grounds_select_upgrade']='Class Promotion Selection';
	$lang['town_training_grounds_select']='Promote';
	$lang['town_training_grounds_select_upgrade_cost']='The cost of a promotion is %s %s';
	$lang['town_training_grounds_select_upgrade_must']='You must select a class';
	$lang['town_training_grounds_select_upgrade_done']='Class successfully promoted!';
	$lang['town_training_grounds_change_class_cost']='The cost to change your class is %s %s';
	$lang['town_training_grounds_change_class_forbid']='You are not allowed to change your class';
	$lang['town_training_grounds_change_class_must']='You must select a class';
	$lang['town_training_grounds_change_class_done']='Class successfully modified!';
	$lang['town_training_grounds_change_class_upgrade']='New Class Selection';
	$lang['town_training_grounds_change_class']='Change Class';
	$lang['town_training_grounds_train_skill_cost']='Training Cost';
	$lang['town_training_grounds_train_skill_action']='Train this skill';
	$lang['town_training_grounds_train_skill_must']='You must select a skill';
	$lang['town_training_grounds_train_skill_done']='You have increased the level of this skill';
	$lang['town_training_grounds_train_charac_action']='Train this Characteristic';
	$lang['town_training_grounds_train_charac_must']='You must select a characteristic';
	$lang['town_training_grounds_train_charac_done']='You have increased the level of this characteristic';
	$lang['town_warehouse']='Warehouse';
	$lang['lack_warehouse']='Sorry, you do not own a Warehouse.<br /><br />Please open one first';
}

if ( defined('IN_PREFERENCES'))
{
	$lang['pvp_prefs']='Battles between users';
	$lang['pvp_prefs_notification_pm']='Enable notification of events by private message';
	$lang['pvp_prefs_allow_defies']='Allow other users to challenge me';
}

if ( defined('IN_EQUIPMENT'))
{
	$lang['equip']='Equip Prior to Battle';
	$lang['equip_done']='The selected items have been equipped';
	$lang['equip_title']='Select your equipment prior to battle';
	$lang['equip_title_of']='%s\'s Equipment';
	$lang['equip_armor']='<b>Armour</b>';
	$lang['equip_buckler']='<b>Shield</b>';
	$lang['equip_helm']='<b>Helm</b>';
	$lang['equip_gloves']='<b>Gloves</b>';
	$lang['equip_amulet']='<b>Amulet</b>';
	$lang['equip_ring']='<b>Ring</b>';
}

if ( defined('IN_PVP'))
{
	$lang['pvp_defy']='Challenge';
	$lang['pvp_waiting_battles']='Challenges on Standby';
	$lang['pvp_waiting_battles_you']='Challenges awaiting your approval';
	$lang['pvp_waiting_battles_other']='Challenges awaiting approval from your opponent';
	$lang['pvp_current_battles']='Current Battles';
	$lang['pvp_opponent']='Opponent';
	$lang['pvp_turn']='Current turn: ';
	$lang['pvp_join']='Join';
	$lang['pvp_stop']='Abandon Battle';
	$lang['pvp_defy_user']='Select a user to challenge';
	$lang['pvp_defy_already']='A challenge is currently active with this user';
	$lang['pvp_defy_select']='Select a user to defy';
	$lang['pvp_defy_ok']='You have challenged this user';
	$lang['pvp_defied_by']='%s has challenged you';
	$lang['pvp_defied_by_link']='. You can click on this link : %s to approve or deny this challenge .';
	$lang['pvp_waiting_accept']='Accept';
	$lang['pvp_waiting_deny']='Reject';
	$lang['pvp_deny_ok']='This challenge has been denied';
	$lang['pvp_denied']='Your challenge has been rejected';
	$lang['pvp_denied_by']='%s has rejected your challenge.';
	$lang['pvp_defy_accept']='Accept the Challenge';
	$lang['pvp_accepted']='Your challenge has been accepted';
	$lang['pvp_accepted_by']='%s has accepted your challenge.';
	$lang['pvp_defy_accepted_ok']='The battle can now begin!';
	$lang['pvp_stopped']='Abandon current challenge';
	$lang['pvp_stopped_by']='%s has abandoned your challenge.';
	$lang['pvp_stop_ok']='You have abandoned this challenge';
	$lang['pvp_disabled']='Battles between players are disabled';
	$lang['pvp_wrong_turn']='This is not your turn to play!';
	$lang['pvp_exploit_error']='Trying to use a PvP exploit, eh?.<br /><br />Well, your forum admin has been notified & will deal with your account accordingly! Hahaha...';
	$lang['pvp_regen_xp']='%s regenerates %s Health points!';
	$lang['pvp_regen_mp']='%s regenerates %s Mana points!';
	$lang['pvp_flee']='Victory by default';
	$lang['pvp_flee_by']='%s has fleed from the PvP battle against you. You have been credited the win by default.';
	$lang['pvp_flee_failure']='%s attempted to flee from battle but failed!';

	$lang['pvp_spell_success']='%s casts %s [%s element], upon %s, inflicting %s damage!';
	$lang['pvp_spell_success_norm']='%s casts %s, upon %s, inflicting %s damage!';
	$lang['pvp_spell_dura']='%s\'s spell %s has run out of charge and is discarded.';
	$lang['pvp_spell_failure']='%s casts %s upon %s but fails to inflict any damage!';
	$lang['pvp_spell_defensive_success']='%s casts %s upon himself. %s\'s physical attack and defense increases by %s points!';
	$lang['pvp_potion_hp_dura']='%s discards the used %s.';
	$lang['pvp_potion_hp_success']='%s drinks %s restoring %s HP!';
	$lang['pvp_potion_mp_success']='%s drinks %s restoring %s MP!';
	$lang['pvp_attack_dura']='%s\'s %s breaks beyond repair & is discarded.';
	$lang['pvp_attack_success']='%s strikes %s with a %s [%s element] inflicting %s damage!';
	$lang['pvp_attack_success_norm']='%s strikes %s with a %s inflicting %s damage!';
	$lang['pvp_attack_failure']='%s attempts to strike %s with a %s but misses!';
	$lang['pvp_attack_bare_success']='%s strikes %s with his bare fists inflicting %s points of damage!';
	$lang['pvp_attack_bare_fail']='%s attempts to strike %s with his bare hands but misses!';
	$lang['pvp_start_pvp']='PvP match against %s%s%s accepted and has now begun.';
	$lang['pvp_start_pvp_1']='Click %shere%s to go straight to the battle or click %shere%s to go back to your current PvP battle list.';
	$lang['pvp_refresh_page']='Refresh Page';

	$lang['pvp_battle_chat']='Chat';
	$lang['pvp_lost']='You have been defeated';
	$lang['pvp_lost_by']='%s inflicted a death blow of %s damage and has defeated you';
	$lang['pvp_won']='Victory!';
	$lang['pvp_won_by']='You inflict a death blow of %s damage and are victorious against %s! You win %s experience points and %s %s!';
	$lang['pvp_turn']='New turn';
	$lang['pvp_turn_by']='It is currently your turn to play in the challenge against %s';
	$lang['pvp_end_turn']='You inflict %s damage upon your opponent.<br /><br />Your turn has now ended';
	$lang['pvp_defy_too_much']='Please finish your current challenges before beginning any new ones';
	$lang['pvp_waiting_break']='Cancel';
	$lang['pvp_broken']='Challenge cancelled';
	$lang['pvp_broken_by']='%s has cancelled the challenge';
	$lang['pvp_broken_ok']='This challenge has been cancelled';
	$lang['pvp_see']='View Battle!';
	$lang['pvp_your_turn']='Your Turn!';
    $lang['pvp_comms']='PvP Battle Messages';
    $lang['pvp_custom_taunt']='Type Message';
	$lang['pvp_defy_too_much_opponent']='The opponent has reached the maximum active PvP battles allowed at any one time. PvP request cancelled.';
	$lang['pvp_opponent_dead']='The opponent is currently dead. PvP request cancelled.';
	$lang['battle_flee_pvp']='You successfully flee from battle!';

	// Graphical battle keys
	$lang['pvp_taunt_none']='Select custom taunt...';
	$lang['pvp_taunt_1']='Good fight!';
	$lang['pvp_taunt_2']='Have some!';
	$lang['pvp_taunt_3']='Ah damn!';
	$lang['pvp_taunt_4']='Punk!';
	$lang['pvp_taunt_5']='I\'m gonna slice and dice ya\'!';
	$lang['pvp_taunt_6']='You son of a...!';
	$lang['pvp_taunt_7']='Stop waving your Sword around like a feather duster!';
	$lang['pvp_taunt_8']='Who\'s your daddy?!';
	$lang['pvp_taunt_9']='Get some, get some!';
	$lang['pvp_taunt_10']='I\'ll swap ye decks with ye!';
}

?>