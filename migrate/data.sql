
CREATE TABLE config (
  config_name varchar(255) NOT NULL default '0',
  config_value int(15) NOT NULL default '0',
  PRIMARY KEY  (config_name)
) Engine=InnoDB;

INSERT INTO config (config_name, config_value) VALUES ('max_characteristic', 20);
INSERT INTO config (config_name, config_value) VALUES ('min_characteristic', 3);
INSERT INTO config (config_name, config_value) VALUES ('allow_reroll', 1);
INSERT INTO config (config_name, config_value) VALUES ('allow_character_delete', 1);
INSERT INTO config (config_name, config_value) VALUES ('allow_shop_steal', 1);
INSERT INTO config (config_name, config_value) VALUES ('new_shop_price', 500);
INSERT INTO config (config_name, config_value) VALUES ('item_modifier_power', 100);
INSERT INTO config (config_name, config_value) VALUES ('skill_trading_power', 2);
INSERT INTO config (config_name, config_value) VALUES ('skill_thief_failure_damage', 2000);
INSERT INTO config (config_name, config_value) VALUES ('skill_thief_failure_punishment', 1);
INSERT INTO config (config_name, config_value) VALUES ('skill_thief_failure_type', 2);
INSERT INTO config (config_name, config_value) VALUES ('skill_thief_failure_time', 6);
INSERT INTO config (config_name, config_value) VALUES ('vault_loan_enable', 1);
INSERT INTO config (config_name, config_value) VALUES ('interests_rate', 4);
INSERT INTO config (config_name, config_value) VALUES ('interests_time', 86400);
INSERT INTO config (config_name, config_value) VALUES ('loan_interests', 15);
INSERT INTO config (config_name, config_value) VALUES ('loan_interests_time', 864000);
INSERT INTO config (config_name, config_value) VALUES ('loan_max_sum', 5000);
INSERT INTO config (config_name, config_value) VALUES ('loan_requirements', 0);
INSERT INTO config (config_name, config_value) VALUES ('stock_max_change', 10);
INSERT INTO config (config_name, config_value) VALUES ('stock_min_change', 0);
INSERT INTO config (config_name, config_value) VALUES ('vault_enable', 1);
INSERT INTO config (config_name, config_value) VALUES ('battle_enable', 1);
INSERT INTO config (config_name, config_value) VALUES ('battle_monster_stats_modifier', 150);
INSERT INTO config (config_name, config_value) VALUES ('battle_base_exp_min', 10);
INSERT INTO config (config_name, config_value) VALUES ('battle_base_exp_max', 40);
INSERT INTO config (config_name, config_value) VALUES ('battle_base_exp_modifier', 120);
INSERT INTO config (config_name, config_value) VALUES ('battle_base_reward_min', 10);
INSERT INTO config (config_name, config_value) VALUES ('battle_base_reward_max', 40);
INSERT INTO config (config_name, config_value) VALUES ('battle_base_reward_modifier', 120);
INSERT INTO config (config_name, config_value) VALUES ('temple_heal_cost', 100);
INSERT INTO config (config_name, config_value) VALUES ('temple_resurrect_cost', 300);
INSERT INTO config (config_name, config_value) VALUES ('cell_allow_user_caution', '1');
INSERT INTO config (config_name, config_value) VALUES ('cell_allow_user_judge', '1');
INSERT INTO config (config_name, config_value) VALUES ('cell_allow_user_blank', '1');
INSERT INTO config (config_name, config_value) VALUES ('cell_amount_user_blank', '5000');
INSERT INTO config (config_name, config_value) VALUES ('cell_user_judge_voters', '10');
INSERT INTO config (config_name, config_value) VALUES ('cell_user_judge_posts', '2');
INSERT INTO config (config_name, config_value) VALUES ('item_power_level', 0);
INSERT INTO config (config_name, config_value) VALUES ('training_skill_cost', 1000);
INSERT INTO config (config_name, config_value) VALUES ('training_charac_cost', 3000);
INSERT INTO config (config_name, config_value) VALUES ('training_upgrade_cost', 10000);
INSERT INTO config (config_name, config_value) VALUES ('training_allow_change', 1);
INSERT INTO config (config_name, config_value) VALUES ('training_change_cost', 100);
INSERT INTO config (config_name, config_value) VALUES ('next_level_penalty', '10');
INSERT INTO config (config_name, config_value) VALUES ('battle_pvp_enable', '1');
INSERT INTO config (config_name, config_value) VALUES ('battle_pvp_defies_max', '5');
INSERT INTO config (config_name, config_value) VALUES ('pvp_base_exp_min', 10);
INSERT INTO config (config_name, config_value) VALUES ('pvp_base_exp_max', 40);
INSERT INTO config (config_name, config_value) VALUES ('pvp_base_exp_modifier', 120);
INSERT INTO config (config_name, config_value) VALUES ('pvp_base_reward_min', 10);
INSERT INTO config (config_name, config_value) VALUES ('pvp_base_reward_max', 40);
INSERT INTO config (config_name, config_value) VALUES ('pvp_base_reward_modifier', 120);
INSERT INTO config (config_name, config_value) VALUES ('weight_enable', 1);
INSERT INTO config (config_name, config_value) VALUES ('disable_rpg', 1);
INSERT INTO config (config_name, config_value) VALUES ('limit_regen_duration', 1);
INSERT INTO config (config_name, config_value) VALUES ('character_limit_enable', 1);
INSERT INTO config (config_name, config_value) VALUES ('character_battle_limit', 20);
INSERT INTO config (config_name, config_value) VALUES ('character_skill_limit', 30);
INSERT INTO config (config_name, config_value) VALUES ('character_trading_limit', 30);
INSERT INTO config (config_name, config_value) VALUES ('character_thief_limit', 10);
INSERT INTO config (config_name, config_value) VALUES ('battle_base_sp_modifier', 120);
INSERT INTO config (config_name, config_value) VALUES ('posts_enable', 0);
INSERT INTO config (config_name, config_value) VALUES ('posts_min', 1);
INSERT INTO config (config_name, config_value) VALUES ('battle_calc_type', 1);
INSERT INTO config (config_name, config_value) VALUES ('cache_interval', 15);
INSERT INTO config (config_name, config_value) VALUES ('cache_last_updated', 0);
INSERT INTO config (config_name, config_value) VALUES ('shop_steal_sell', 1);
INSERT INTO config (config_name, config_value) VALUES ('shop_steal_min_lvl', 5);
INSERT INTO config (config_name, config_value) VALUES ('shop_steal_show', 0);


CREATE TABLE alignments (
  alignment_id smallint(8) NOT NULL default '0',
  alignment_name varchar(255) NOT NULL default '',
  alignment_desc text NOT NULL,
  alignment_level tinyint(1) NOT NULL default '0',
  alignment_img varchar(255) NOT NULL default '',
  PRIMARY KEY  (alignment_id)
) Engine=InnoDB;

INSERT INTO alignments (alignment_id, alignment_name, alignment_desc, alignment_level, alignment_img) VALUES (1, 'alignment_neutral', 'alignment_neutral_desc', 0, 'Neutral.gif');
INSERT INTO alignments (alignment_id, alignment_name, alignment_desc, alignment_level, alignment_img) VALUES (2, 'alignment_evil', 'alignment_evil_desc', 0, 'Evil.gif');
INSERT INTO alignments (alignment_id, alignment_name, alignment_desc, alignment_level, alignment_img) VALUES (3, 'alignment_good', 'alignment_good_desc', 0, 'Good.gif');


CREATE TABLE battle_monsters (
  monster_id int(8) NOT NULL default '0',
  monster_name varchar(255) NOT NULL default '',
  monster_img varchar(255) NOT NULL default '',
  monster_level int(8) NOT NULL default '0',
  monster_base_hp int(8) NOT NULL default '0',
  monster_base_att int(8) NOT NULL default '0',
  monster_base_def int(8) NOT NULL default '0',
  monster_base_mp int(8) NOT NULL default '10',
  monster_base_mp_power int(8) NOT NULL default '1',
  monster_base_custom_spell varchar(255) NOT NULL default 'a magical spell',
  monster_base_magic_attack int(8) NOT NULL default '10',
  monster_base_magic_resistance int(8) NOT NULL default '10',
  monster_base_sp int(8) NOT NULL default '0',
  monster_thief_skill int(3) NOT NULL default '0',
  monster_base_element int(3) NOT NULL default '1',
  PRIMARY KEY  (monster_id)
) Engine=InnoDB;

INSERT INTO battle_monsters (monster_id, monster_name, monster_img, monster_level, monster_base_hp, monster_base_att, monster_base_def) VALUES (1, 'Globuz', 'Monster1.jpg', 1, 15, 30, 30);
INSERT INTO battle_monsters (monster_id, monster_name, monster_img, monster_level, monster_base_hp, monster_base_att, monster_base_def) VALUES (2, 'Kargh', 'Monster2.jpg', 2, 20, 40, 60);
INSERT INTO battle_monsters (monster_id, monster_name, monster_img, monster_level, monster_base_hp, monster_base_att, monster_base_def) VALUES (3, 'Bouglou', 'Monster3.jpg', 1, 14, 40, 70);
INSERT INTO battle_monsters (monster_id, monster_name, monster_img, monster_level, monster_base_hp, monster_base_att, monster_base_def) VALUES (4, 'Dretg', 'Monster4.jpg', 1, 25, 30, 30);
INSERT INTO battle_monsters (monster_id, monster_name, monster_img, monster_level, monster_base_hp, monster_base_att, monster_base_def) VALUES (5, 'Greyiok', 'Monster5.jpg', 1, 10, 70, 70);
INSERT INTO battle_monsters (monster_id, monster_name, monster_img, monster_level, monster_base_hp, monster_base_att, monster_base_def) VALUES (6, 'Itchy', 'Monster6.jpg', 2, 25, 90, 80);
INSERT INTO battle_monsters (monster_id, monster_name, monster_img, monster_level, monster_base_hp, monster_base_att, monster_base_def) VALUES (7, 'Globber', 'Monster7.jpg', 3, 45, 250, 200);
INSERT INTO battle_monsters (monster_id, monster_name, monster_img, monster_level, monster_base_hp, monster_base_att, monster_base_def) VALUES (8, 'Scratchy', 'Monster8.jpg', 4, 80, 350, 300);


CREATE TABLE classes (
  class_id smallint(8) NOT NULL default '0',
  class_name varchar(255) NOT NULL default '',
  class_desc text NOT NULL,
  class_level tinyint(1) NOT NULL default '0',
  class_img varchar(255) NOT NULL default '',
  class_might_req int(8) NOT NULL default '0',
  class_dexterity_req int(8) NOT NULL default '0',
  class_constitution_req int(8) NOT NULL default '0',
  class_intelligence_req int(8) NOT NULL default '0',
  class_wisdom_req int(8) NOT NULL default '0',
  class_charisma_req int(8) NOT NULL default '0',
  class_base_hp int(8) NOT NULL default '0',
  class_base_mp int(8) NOT NULL default '0',
  class_base_ac int(8) NOT NULL default '0',
  class_update_hp int(8) NOT NULL default '0',
  class_update_mp int(8) NOT NULL default '0',
  class_update_ac int(8) NOT NULL default '0',
  class_update_xp_req int(8) NOT NULL default '0',
  class_update_of int(8) NOT NULL default '0',
  class_update_of_req int(8) NOT NULL default '0',
  class_selectable int(8) NOT NULL default '0',
  class_magic_attack_req int(8) NOT NULL default '0',
  class_magic_resistance_req int(8) NOT NULL default '0',
  PRIMARY KEY  (class_id)
) Engine=InnoDB;

INSERT INTO classes (class_id, class_name, class_desc, class_level, class_img, class_might_req, class_dexterity_req, class_constitution_req, class_intelligence_req, class_wisdom_req, class_charisma_req, class_base_hp, class_base_mp, class_base_ac, class_update_hp, class_update_mp, class_update_ac, class_update_xp_req, class_update_of, class_update_of_req, class_selectable) VALUES (1, 'class_fighter', 'class_fighter_desc', 0, 'Fighter.gif', 0, 0, 0, 0, 0, 0, 30, 2, 15, 3, 0, 1, 1500, 0, 0, 1);
INSERT INTO classes (class_id, class_name, class_desc, class_level, class_img, class_might_req, class_dexterity_req, class_constitution_req, class_intelligence_req, class_wisdom_req, class_charisma_req, class_base_hp, class_base_mp, class_base_ac, class_update_hp, class_update_mp, class_update_ac, class_update_xp_req, class_update_of, class_update_of_req, class_selectable) VALUES (2, 'class_barbare', 'class_barbare_desc', 0, 'Barbare.gif', 12, 0, 10, 0, 0, 0, 40, 1, 10, 4, 0, 0, 2000, 1, 5, 1);
INSERT INTO classes (class_id, class_name, class_desc, class_level, class_img, class_might_req, class_dexterity_req, class_constitution_req, class_intelligence_req, class_wisdom_req, class_charisma_req, class_base_hp, class_base_mp, class_base_ac, class_update_hp, class_update_mp, class_update_ac, class_update_xp_req, class_update_of, class_update_of_req, class_selectable) VALUES (3, 'class_druid', 'class_druid_desc', 0, 'Druid.gif', 0, 0, 0, 0, 10, 0, 20, 20, 10, 1, 2, 2, 1800, 0, 0, 1);
INSERT INTO classes (class_id, class_name, class_desc, class_level, class_img, class_might_req, class_dexterity_req, class_constitution_req, class_intelligence_req, class_wisdom_req, class_charisma_req, class_base_hp, class_base_mp, class_base_ac, class_update_hp, class_update_mp, class_update_ac, class_update_xp_req, class_update_of, class_update_of_req, class_selectable) VALUES (4, 'class_bard', 'class_bard_desc', 0, 'Bard.gif', 3, 3, 3, 3, 3, 10, 15, 15, 15, 2, 2, 2, 1200, 0, 0, 1);
INSERT INTO classes (class_id, class_name, class_desc, class_level, class_img, class_might_req, class_dexterity_req, class_constitution_req, class_intelligence_req, class_wisdom_req, class_charisma_req, class_base_hp, class_base_mp, class_base_ac, class_update_hp, class_update_mp, class_update_ac, class_update_xp_req, class_update_of, class_update_of_req, class_selectable) VALUES (5, 'class_magician', 'class_magician_desc', 0, 'Magician.gif', 0, 0, 0, 14, 14, 0, 8, 30, 5, 0, 1, 3, 2500, 0, 0, 1);
INSERT INTO classes (class_id, class_name, class_desc, class_level, class_img, class_might_req, class_dexterity_req, class_constitution_req, class_intelligence_req, class_wisdom_req, class_charisma_req, class_base_hp, class_base_mp, class_base_ac, class_update_hp, class_update_mp, class_update_ac, class_update_xp_req, class_update_of, class_update_of_req, class_selectable) VALUES (6, 'class_monk', 'class_monk_desc', 0, 'Monk.gif', 5, 5, 5, 5, 5, 5, 25, 10, 20, 2, 2, 1, 2400, 0, 0, 1);
INSERT INTO classes (class_id, class_name, class_desc, class_level, class_img, class_might_req, class_dexterity_req, class_constitution_req, class_intelligence_req, class_wisdom_req, class_charisma_req, class_base_hp, class_base_mp, class_base_ac, class_update_hp, class_update_mp, class_update_ac, class_update_xp_req, class_update_of, class_update_of_req, class_selectable) VALUES (7, 'class_paladin', 'class_paladin_desc', 0, 'Paladin.gif', 10, 8, 10, 10, 8, 15, 40, 15, 20, 2, 4, 1, 3000, 0, 0, 1);
INSERT INTO classes (class_id, class_name, class_desc, class_level, class_img, class_might_req, class_dexterity_req, class_constitution_req, class_intelligence_req, class_wisdom_req, class_charisma_req, class_base_hp, class_base_mp, class_base_ac, class_update_hp, class_update_mp, class_update_ac, class_update_xp_req, class_update_of, class_update_of_req, class_selectable) VALUES (8, 'class_priest', 'class_priest_desc', 0, 'Priest.gif', 0, 0, 0, 10, 12, 0, 20, 20, 15, 1, 2, 2, 2000, 0, 0, 1);
INSERT INTO classes (class_id, class_name, class_desc, class_level, class_img, class_might_req, class_dexterity_req, class_constitution_req, class_intelligence_req, class_wisdom_req, class_charisma_req, class_base_hp, class_base_mp, class_base_ac, class_update_hp, class_update_mp, class_update_ac, class_update_xp_req, class_update_of, class_update_of_req, class_selectable) VALUES (9, 'class_sorceror', 'class_sorceror_desc', 0, 'Sorcerer.gif', 0, 0, 0, 16, 0, 0, 30, 100, 10, 0, 1, 10, 4500, 5, 10, 0);
INSERT INTO classes (class_id, class_name, class_desc, class_level, class_img, class_might_req, class_dexterity_req, class_constitution_req, class_intelligence_req, class_wisdom_req, class_charisma_req, class_base_hp, class_base_mp, class_base_ac, class_update_hp, class_update_mp, class_update_ac, class_update_xp_req, class_update_of, class_update_of_req, class_selectable) VALUES (10, 'class_thief', 'class_thief_desc', 0, 'Thief.gif', 0, 12, 0, 0, 0, 0, 20, 10, 10, 1, 2, 1, 1500, 0, 0, 1);

CREATE TABLE elements (
  element_id smallint(8) NOT NULL default '0',
  element_name varchar(255) NOT NULL default '',
  element_desc text NOT NULL,
  element_level tinyint(1) NOT NULL default '0',
  element_img varchar(255) NOT NULL default '',
  element_skill_mining_bonus int(8) NOT NULL default '0',
  element_skill_stone_bonus int(8) NOT NULL default '0',
  element_skill_forge_bonus int(8) NOT NULL default '0',
  element_skill_enchantment_bonus int(8) NOT NULL default '0',
  element_skill_trading_bonus int(8) NOT NULL default '0',
  element_skill_thief_bonus int(8) NOT NULL default '0',
  element_oppose_strong int(3) NOT NULL default '0',
  element_oppose_strong_dmg int(3) NOT NULL default '100',
  element_oppose_same_dmg int(3) NOT NULL default '100',
  element_oppose_weak int(3) NOT NULL default '0',
  element_oppose_weak_dmg int(3) NOT NULL default '100',
  element_colour varchar(255) NOT NULL default '',
  PRIMARY KEY  (element_id)
) Engine=InnoDB;

INSERT INTO elements (element_id, element_name, element_desc, element_level, element_img, element_skill_mining_bonus, element_skill_stone_bonus, element_skill_forge_bonus, element_skill_enchantment_bonus, element_skill_trading_bonus, element_skill_thief_bonus) VALUES (1, 'element_water', 'element_water_desc', 0, 'Water.gif', 0, 0, 0, 1, 0, 0);
INSERT INTO elements (element_id, element_name, element_desc, element_level, element_img, element_skill_mining_bonus, element_skill_stone_bonus, element_skill_forge_bonus, element_skill_enchantment_bonus, element_skill_trading_bonus, element_skill_thief_bonus) VALUES (2, 'element_earth', 'element_earth_desc', 0, 'Earth.gif', 1, 1, 0, 0, 0, 0);
INSERT INTO elements (element_id, element_name, element_desc, element_level, element_img, element_skill_mining_bonus, element_skill_stone_bonus, element_skill_forge_bonus, element_skill_enchantment_bonus, element_skill_trading_bonus, element_skill_thief_bonus) VALUES (3, 'element_holy', 'element_holy_desc', 2, 'Holy.gif', 1, 1, 1, 1, 1, 1);
INSERT INTO elements (element_id, element_name, element_desc, element_level, element_img, element_skill_mining_bonus, element_skill_stone_bonus, element_skill_forge_bonus, element_skill_enchantment_bonus, element_skill_trading_bonus, element_skill_thief_bonus) VALUES (4, 'element_fire', 'element_fire_desc', 0, 'Fire.gif', 0, 0, 1, 0, 0, 0);


CREATE TABLE races (
  race_id smallint(8) NOT NULL default '0',
  race_name varchar(255) NOT NULL default '',
  race_desc text NOT NULL,
  race_level tinyint(1) NOT NULL default '0',
  race_img varchar(255) NOT NULL default '',
  race_might_bonus int(8) NOT NULL default '0',
  race_dexterity_bonus int(8) NOT NULL default '0',
  race_constitution_bonus int(8) NOT NULL default '0',
  race_intelligence_bonus int(8) NOT NULL default '0',
  race_wisdom_bonus int(8) NOT NULL default '0',
  race_charisma_bonus int(8) NOT NULL default '0',
  race_skill_mining_bonus int(8) NOT NULL default '0',
  race_skill_stone_bonus int(8) NOT NULL default '0',
  race_skill_forge_bonus int(8) NOT NULL default '0',
  race_skill_enchantment_bonus int(8) NOT NULL default '0',
  race_skill_trading_bonus int(8) NOT NULL default '0',
  race_skill_thief_bonus int(8) NOT NULL default '0',
  race_might_malus int(8) NOT NULL default '0',
  race_dexterity_malus int(8) NOT NULL default '0',
  race_constitution_malus int(8) NOT NULL default '0',
  race_intelligence_malus int(8) NOT NULL default '0',
  race_wisdom_malus int(8) NOT NULL default '0',
  race_charisma_malus int(8) NOT NULL default '0',
  race_weight int(12) NOT NULL default '1000',
  race_weight_per_level int(3) NOT NULL default '5',
  race_magic_attack_bonus int(8) NOT NULL default '0',
  race_magic_resistance_bonus int(8) NOT NULL default '0',
  race_magic_attack_malus int(8) NOT NULL default '0',
  race_magic_resistance_malus int(8) NOT NULL default '0',
  PRIMARY KEY  (race_id)
) Engine=InnoDB;

INSERT INTO races (race_id, race_name, race_desc, race_level, race_img, race_might_bonus, race_dexterity_bonus, race_constitution_bonus, race_intelligence_bonus, race_wisdom_bonus, race_charisma_bonus, race_skill_mining_bonus, race_skill_stone_bonus, race_skill_forge_bonus, race_skill_enchantment_bonus, race_skill_trading_bonus, race_skill_thief_bonus, race_might_malus, race_dexterity_malus, race_constitution_malus, race_intelligence_malus, race_wisdom_malus, race_charisma_malus) VALUES (1, 'race_human', 'race_human_desc', 0, 'Human.gif', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO races (race_id, race_name, race_desc, race_level, race_img, race_might_bonus, race_dexterity_bonus, race_constitution_bonus, race_intelligence_bonus, race_wisdom_bonus, race_charisma_bonus, race_skill_mining_bonus, race_skill_stone_bonus, race_skill_forge_bonus, race_skill_enchantment_bonus, race_skill_trading_bonus, race_skill_thief_bonus, race_might_malus, race_dexterity_malus, race_constitution_malus, race_intelligence_malus, race_wisdom_malus, race_charisma_malus) VALUES (2, 'race_half-elf', 'race_half-elf_desc', 0, 'Half-elf.gif', 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO races (race_id, race_name, race_desc, race_level, race_img, race_might_bonus, race_dexterity_bonus, race_constitution_bonus, race_intelligence_bonus, race_wisdom_bonus, race_charisma_bonus, race_skill_mining_bonus, race_skill_stone_bonus, race_skill_forge_bonus, race_skill_enchantment_bonus, race_skill_trading_bonus, race_skill_thief_bonus, race_might_malus, race_dexterity_malus, race_constitution_malus, race_intelligence_malus, race_wisdom_malus, race_charisma_malus) VALUES (3, 'race_half-orc', 'race_half-orc_desc', 0, 'Half-orc.gif', 2, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 3);
INSERT INTO races (race_id, race_name, race_desc, race_level, race_img, race_might_bonus, race_dexterity_bonus, race_constitution_bonus, race_intelligence_bonus, race_wisdom_bonus, race_charisma_bonus, race_skill_mining_bonus, race_skill_stone_bonus, race_skill_forge_bonus, race_skill_enchantment_bonus, race_skill_trading_bonus, race_skill_thief_bonus, race_might_malus, race_dexterity_malus, race_constitution_malus, race_intelligence_malus, race_wisdom_malus, race_charisma_malus) VALUES (4, 'race_elf', 'race_elf_desc', 0, 'Elf.gif', 0, 2, 0, 0, 0, 2, 0, 0, 0, 1, 1, 0, 1, 0, 2, 0, 0, 0);
INSERT INTO races (race_id, race_name, race_desc, race_level, race_img, race_might_bonus, race_dexterity_bonus, race_constitution_bonus, race_intelligence_bonus, race_wisdom_bonus, race_charisma_bonus, race_skill_mining_bonus, race_skill_stone_bonus, race_skill_forge_bonus, race_skill_enchantment_bonus, race_skill_trading_bonus, race_skill_thief_bonus, race_might_malus, race_dexterity_malus, race_constitution_malus, race_intelligence_malus, race_wisdom_malus, race_charisma_malus) VALUES (5, 'race_gnome', 'race_gnome_desc', 0, 'Gnome.gif', 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0);
INSERT INTO races (race_id, race_name, race_desc, race_level, race_img, race_might_bonus, race_dexterity_bonus, race_constitution_bonus, race_intelligence_bonus, race_wisdom_bonus, race_charisma_bonus, race_skill_mining_bonus, race_skill_stone_bonus, race_skill_forge_bonus, race_skill_enchantment_bonus, race_skill_trading_bonus, race_skill_thief_bonus, race_might_malus, race_dexterity_malus, race_constitution_malus, race_intelligence_malus, race_wisdom_malus, race_charisma_malus) VALUES (6, 'race_halfeling', 'race_halfeling_desc', 2, 'Halfeling.gif', 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 3, 0, 0, 2, 0, 0, 0);
INSERT INTO races (race_id, race_name, race_desc, race_level, race_img, race_might_bonus, race_dexterity_bonus, race_constitution_bonus, race_intelligence_bonus, race_wisdom_bonus, race_charisma_bonus, race_skill_mining_bonus, race_skill_stone_bonus, race_skill_forge_bonus, race_skill_enchantment_bonus, race_skill_trading_bonus, race_skill_thief_bonus, race_might_malus, race_dexterity_malus, race_constitution_malus, race_intelligence_malus, race_wisdom_malus, race_charisma_malus) VALUES (7, 'race_dwarf', 'race_dwarf_desc', 0, 'Dwarf.gif', 1, 0, 2, 0, 1, 0, 2, 2, 1, 0, 0, 0, 0, 2, 0, 0, 0, 3);


CREATE TABLE shops (
  shop_id int(8) NOT NULL default '0',
  shop_owner_id int(8) NOT NULL default '0',
  shop_name varchar(255) NOT NULL default '',
  shop_desc varchar(255) NOT NULL default '',
  shop_last_updated int(12) NOT NULL default '0',
  PRIMARY KEY  (shop_id)
) Engine=InnoDB;
INSERT INTO shops (shop_id, shop_owner_id, shop_name, shop_desc) VALUES (1, 1, 'shop_forums', 'shop_forums_desc');


CREATE TABLE stores (
  store_id int(8) NOT NULL auto_increment,
  store_name varchar(100) NOT NULL default '',
  store_desc varchar(255) NOT NULL default '',
  store_img varchar(255) NOT NULL default '',
  store_status tinyint(1) NOT NULL default '1',
  store_sales_status tinyint(1) NOT NULL default '0',
  store_admin tinyint(1) NOT NULL default '0',
  store_owner_id int(1) NOT NULL default '1',
  KEY store_id (store_id)
) Engine=InnoDB;

INSERT INTO stores(store_id, store_name, store_desc, store_img, store_status, store_sales_status, store_admin) VALUES(1, 'Forum Store', 'The general forum store', '',1 ,0 ,0 );
INSERT INTO stores(store_name, store_desc, store_img, store_status, store_sales_status, store_admin) VALUES('Admin Only Store', 'Viewable only by the board admin', '',1 ,0 ,1 );


CREATE TABLE shops_items (
  item_id int(8) NOT NULL auto_increment,
  item_owner_id int(8) NOT NULL default '0',
  item_price int(8) NOT NULL default '0',
  item_quality int(8) NOT NULL default '0',
  item_power int(8) NOT NULL default '0',
  item_duration int(8) NOT NULL default '0',
  item_duration_max int(8) NOT NULL default '1',
  item_icon varchar(255) NOT NULL default '',
  item_name varchar(255) NOT NULL default '',
  item_desc varchar(255) NOT NULL default '',
  item_type_use int(8) NOT NULL default '16',
  item_in_shop tinyint(1) NOT NULL default '0',
  item_store_id int(8) NOT NULL default '1',
  item_weight int(12) NOT NULL default '25',
  item_auth int(1) NOT NULL default '0',
  item_max_skill int(8) NOT NULL default '25',
  item_add_power int(8) NOT NULL default '0',
  item_mp_use int(8) NOT NULL default '0',
  item_monster_thief tinyint(1) NOT NULL default '0',
  item_element int(4) NOT NULL default '0',
  item_element_str_dmg int(4) NOT NULL default '100',
  item_element_same_dmg int(4) NOT NULL default '100',
  item_element_weak_dmg int(4) NOT NULL default '100',
  item_in_warehouse tinyint(1) NOT NULL default '0',
  item_sell_back_percentage int(3) NOT NULL default '50',
  item_stolen_id int(12) NOT NULL default '0',
  item_steal_dc smallint(3) NOT NULL default '0',
  item_bought_timestamp int(12) NOT NULL default '0',
  item_restrict_align_enable tinyint(1) NOT NULL default '0',
  item_restrict_align varchar(255) NOT NULL default '0',
  item_restrict_class_enable tinyint(1) NOT NULL default '0',
  item_restrict_class varchar(255) NOT NULL default '0',
  item_restrict_element_enable tinyint(1) NOT NULL default '0',
  item_restrict_element varchar(255) NOT NULL default '0',
  item_restrict_race_enable tinyint(1) NOT NULL default '0',
  item_restrict_race varchar(255) NOT NULL default '0',
  item_restrict_level int(8) NOT NULL default '0',
  item_restrict_str int(8) NOT NULL default '0',
  item_restrict_dex int(8) NOT NULL default '0',
  item_restrict_int int(8) NOT NULL default '0',
  item_restrict_wis int(8) NOT NULL default '0',
  item_restrict_cha int(8) NOT NULL default '0',
  item_restrict_con int(8) NOT NULL default '0',
  item_crit_hit smallint(3) NOT NULL default '20',
  item_crit_hit_mod smallint(3) NOT NULL default '2',
  item_stolen_timestamp int(12) NOT NULL default '0',
  item_stolen_by varchar(255) NOT NULL default '',
  item_donated_timestamp int(12) NOT NULL default '0',
  item_donated_by varchar(255) NOT NULL default '',
  KEY item_id (item_id),
  KEY item_owner_id (item_owner_id)
) Engine=InnoDB;

INSERT INTO shops_items (`item_id`, `item_owner_id`, `item_price`, `item_quality`, `item_power`, `item_duration`, `item_duration_max`, `item_icon`, `item_name`, `item_desc`, `item_type_use`, `item_in_shop`, `item_store_id`, `item_weight`, `item_auth`, `item_max_skill`, `item_add_power`, `item_mp_use`, `item_monster_thief`, `item_element`, `item_element_str_dmg`, `item_element_same_dmg`, `item_element_weak_dmg`, `item_in_warehouse`, `item_sell_back_percentage`, `item_stolen_id`, `item_steal_dc`, `item_bought_timestamp`, `item_restrict_align_enable`, `item_restrict_align`, `item_restrict_class_enable`, `item_restrict_class`, `item_restrict_element_enable`, `item_restrict_element`, `item_restrict_race_enable`, `item_restrict_race`, `item_restrict_level`, `item_restrict_str`, `item_restrict_dex`, `item_restrict_int`, `item_restrict_wis`, `item_restrict_cha`, `item_restrict_con`, `item_crit_hit`, `item_crit_hit_mod`, `item_stolen_timestamp`, `item_stolen_by`, `item_donated_timestamp`, `item_donated_by`) VALUES 
(11, 1, 27721, 4, 5, 600, 600, 'ring2.gif', 'items_ring_2', 'items_ring_2_desc', 14, 0, 1, 25, 0, 25, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0-', 0, '0-', 0, '0-', 0, '0-', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(10, 1, 11000, 3, 1, 150, 150, 'ring1.gif', 'items_ring_1', 'items_ring_1_desc', 14, 0, 1, 25, 0, 25, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0-', 0, '0-', 0, '0-', 0, '0-', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(9, 1, 1078, 4, 3, 1, 1, 'scroll4.gif', 'items_scroll_4', 'items_scroll_4_desc', 12, 0, 1, 25, 0, 25, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0-', 0, '0-', 0, '0-', 0, '0-', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(8, 1, 550, 3, 1, 1, 1, 'scroll3.gif', 'items_scroll_3', 'items_scroll_3_desc', 12, 0, 1, 25, 0, 25, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0-', 0, '0-', 0, '0-', 0, '0-', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(7, 1, 100, 3, 10, 10, 10, 'scroll2.gif', 'items_scroll_2', 'items_scroll_2_desc', 11, 0, 1, 25, 0, 25, 0, 0, 0, 0, 100, 100, 100, 0, 50, 0, 0, 0, 0, '0', 1, '3,5,8,9,', 0, '0', 0, '0', 5, 0, 0, 20, 0, 0, 0, 20, 2, 0, '', 0, ''),
(6, 1, 550, 3, 1, 1, 1, 'scroll1.gif', 'items_scroll_1', 'items_scroll_1_desc', 11, 0, 1, 25, 0, 25, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0-', 0, '0-', 0, '0-', 0, '0-', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(5, 1, 154, 3, 3, 200, 200, 'miner.gif', 'items_miner', 'items_miner_desc', 3, 0, 1, 25, 0, 25, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0-', 0, '0-', 0, '0-', 0, '0-', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(4, 1, 111, 3, 1, 100, 100, 'tome.gif', 'item_tome', 'item_tome_desc', 4, 0, 1, 25, 0, 25, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 1, 0, 0, '0', 0, '0', 0, '0', 0, '0', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(3, 1, 555, 4, 5, 1, 1, 'diamond.gif', 'items_diamond', 'items_diamond_desc', 2, 0, 1, 25, 0, 25, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0', 0, '0', 0, '0', 0, '0', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(2, 1, 352, 3, 4, 1, 1, 'sapphire.gif', 'items_sapphire', 'items_sapphire_desc', 2, 0, 1, 25, 0, 25, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0-', 0, '0-', 0, '0-', 0, '0-', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(1, 1, 56, 3, 1, 1, 1, 'ore.gif', 'item_ore', 'item_ore_desc', 1, 0, 1, 25, 0, 25, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0-', 0, '0-', 0, '0-', 0, '0-', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(15, 1, 35, 5, 1, 100, 100, 'armor.gif', 'Armour', '', 7, 0, 1, 10, 0, 15, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0', 0, '0', 0, '0', 0, '0', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(16, 1, 25, 3, 1, 100, 100, 'bracer.gif', 'Tough Shield', '', 8, 0, 1, 10, 0, 15, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0', 0, '0', 0, '0', 0, '0', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(13, 1, 13861, 4, 5, 650, 650, 'amulet2.gif', 'items_amulet_2', 'items_amulet_2_desc', 13, 0, 1, 25, 0, 25, 10, 0, 0, 0, 100, 100, 100, 0, 75, 0, 7, 0, 1, '2,3,', 1, '1,2,7,', 0, '0', 0, '0', 7, 0, 0, 15, 15, 0, 0, 20, 2, 0, '', 0, ''),
(17, 1, 15, 1, 1, 100, 100, 'glove.gif', 'Gloves', '', 1, 0, 1, 5, 0, 10, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0', 0, '0', 0, '0', 0, '0', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(14, 1, 25, 4, 1, 100, 100, 'winged-helm.gif', 'Winged Helm', '', 9, 0, 1, 5, 0, 5, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0', 0, '0', 0, '0', 0, '0', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(18, 1, 35, 4, 1, 100, 100, 'sword.gif', 'Sword', '', 5, 0, 1, 5, 0, 10, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0', 0, '0', 0, '0', 0, '0', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(19, 1, 100, 6, 5, 250, 250, 'flail.gif', 'Flail', '', 5, 0, 1, 12, 0, 15, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0', 0, '0', 0, '0', 0, '0', 3, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(20, 1, 150, 4, 10, 300, 300, 'bow.gif', 'Bow', '', 5, 0, 1, 15, 0, 20, 0, 0, 0, 0, 100, 100, 100, 0, 75, 0, 0, 0, 0, '0', 1, '4,5,9,10,', 0, '0', 1, '1,2,4,', 5, 0, 20, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(21, 1, 10, 1, 10, 5, 5, 'potion1.gif', 'Health Potion', '', 15, 0, 1, 3, 0, 0, 0, 0, 0, 0, 100, 100, 100, 0, 5, 0, 0, 0, 0, '0', 0, '0', 0, '0', 0, '0', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, ''),
(22, 1, 10, 4, 10, 5, 5, 'potion2.gif', 'Mana Potion', '', 16, 0, 1, 3, 0, 0, 0, 0, 0, 0, 100, 100, 100, 0, 5, 0, 0, 0, 0, '0', 0, '0', 0, '0', 0, '0', 0, 0, 0, 0, 0, 0, 0, 20, 2, 0, '', 0, '');




CREATE TABLE shops_items_quality (
  item_quality_id int(8) NOT NULL default '0',
  item_quality_modifier_price int(8) NOT NULL default '0',
  item_quality_lang varchar(255) NOT NULL default '',
  PRIMARY KEY  (item_quality_id)
) Engine=InnoDB;

INSERT INTO shops_items_quality (item_quality_id, item_quality_modifier_price, item_quality_lang) VALUES (0, 0, 'dont_care');
INSERT INTO shops_items_quality (item_quality_id, item_quality_modifier_price, item_quality_lang) VALUES (1, 20, 'items_quality_very_poor');
INSERT INTO shops_items_quality (item_quality_id, item_quality_modifier_price, item_quality_lang) VALUES (2, 50, 'items_quality_poor');
INSERT INTO shops_items_quality (item_quality_id, item_quality_modifier_price, item_quality_lang) VALUES (3, 100, 'items_quality_medium');
INSERT INTO shops_items_quality (item_quality_id, item_quality_modifier_price, item_quality_lang) VALUES (4, 140, 'items_quality_good');
INSERT INTO shops_items_quality (item_quality_id, item_quality_modifier_price, item_quality_lang) VALUES (5, 200, 'items_quality_very_good');
INSERT INTO shops_items_quality (item_quality_id, item_quality_modifier_price, item_quality_lang) VALUES (6, 300, 'items_quality_excellent');



CREATE TABLE shops_items_type (
  item_type_id int(8) NOT NULL default '0',
  item_type_base_price int(8) NOT NULL default '0',
  item_type_lang varchar(255) NOT NULL default '',
  PRIMARY KEY  (item_type_id)
) Engine=InnoDB;

INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (0, 0, 'dont_care');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (1, 50, 'items_type_raw_materials');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (2, 200, 'items_type_rare_raw_materials');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (3, 100, 'items_type_tools_pickaxe');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (4, 100, 'items_type_tools_magictome');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (5, 100, 'items_type_weapon');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (6, 1000, 'items_type_enchanted_weapon');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (7, 200, 'items_type_armor');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (8, 100, 'items_type_buckler');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (9, 50, 'items_type_helm');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (10, 50, 'items_type_gloves');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (11, 500, 'items_type_magic_attack');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (12, 500, 'items_type_magic_defend');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (13, 5000, 'items_type_amulet');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (14, 10000, 'items_type_ring');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (15, 20, 'items_type_health_potion');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (16, 20, 'items_type_mana_potion');
INSERT INTO shops_items_type (item_type_id, item_type_base_price, item_type_lang) VALUES (17, 1, 'items_type_misc');



CREATE TABLE skills (
  skill_id tinyint(1) NOT NULL default '0',
  skill_name varchar(255) NOT NULL default '',
  skill_desc text NOT NULL,
  skill_img varchar(255) NOT NULL default '',
  skill_req int(8) NOT NULL default '0',
  skill_chance mediumint(3) NOT NULL default '5',
  PRIMARY KEY  (skill_id)
) Engine=InnoDB;

INSERT INTO skills (skill_id, skill_name, skill_desc, skill_img, skill_req, skill_chance) VALUES (1, 'mining', 'skill_mining_desc', 'skill_mining.gif', 100, 5);
INSERT INTO skills (skill_id, skill_name, skill_desc, skill_img, skill_req, skill_chance) VALUES (2, 'stone', 'skill_stone_desc', 'skill_stone.gif', 200, 5);
INSERT INTO skills (skill_id, skill_name, skill_desc, skill_img, skill_req, skill_chance) VALUES (3, 'forge', 'skill_forge_desc', 'skill_forge.gif', 50, 5);
INSERT INTO skills (skill_id, skill_name, skill_desc, skill_img, skill_req, skill_chance) VALUES (4, 'enchantment', 'skill_enchantment_desc', 'skill_enchantment.gif', 300, 5);
INSERT INTO skills (skill_id, skill_name, skill_desc, skill_img, skill_req, skill_chance) VALUES (5, 'trading', 'skill_trading_desc', 'skill_trading.gif', 80, 5);
INSERT INTO skills (skill_id, skill_name, skill_desc, skill_img, skill_req, skill_chance) VALUES (6, 'thief', 'skill_thief_desc', 'skill_thief.gif', 70, 5);



CREATE TABLE vault_exchange (
  stock_id int(8) NOT NULL default '0',
  stock_name varchar(40) NOT NULL default '',
  stock_desc varchar(255) NOT NULL default '',
  stock_price int(8) NOT NULL default '0',
  stock_previous_price int(8) NOT NULL default '0',
  stock_best_price int(8) NOT NULL default '0',
  stock_worst_price int(8) NOT NULL default '0',
  PRIMARY KEY  (stock_id)
) Engine=InnoDB;

INSERT INTO vault_exchange (stock_id, stock_name, stock_desc, stock_price, stock_previous_price, stock_best_price, stock_worst_price) VALUES (1, 'vault_action_name_1', 'vault_action_desc_1', 113, 108, 113, 100);
INSERT INTO vault_exchange (stock_id, stock_name, stock_desc, stock_price, stock_previous_price, stock_best_price, stock_worst_price) VALUES (2, 'vault_action_name_2', 'vault_action_desc_2', 177, 192, 200, 177);
INSERT INTO vault_exchange (stock_id, stock_name, stock_desc, stock_price, stock_previous_price, stock_best_price, stock_worst_price) VALUES (3, 'vault_action_name_3', 'vault_action_desc_3', 280, 288, 300, 280);
