


CREATE TABLE adr_battle_list (
  battle_id int(8) NOT NULL auto_increment,
  battle_type tinyint(1) NOT NULL default '0',
  battle_turn tinyint(1) NOT NULL default '0',
  battle_result tinyint(1) NOT NULL default '0',
  battle_text text NOT NULL,
  battle_challenger_equipment_info varchar(255) NOT NULL default '',
  battle_round int(12) NOT NULL default '0',
  battle_start int(12) NOT NULL default '0',
  battle_finish int(12) NOT NULL default '0',
  battle_challenger_id int(8) NOT NULL default '0',
  battle_challenger_hp int(8) NOT NULL default '0',
  battle_challenger_mp int(8) NOT NULL default '0',
  battle_challenger_att int(8) NOT NULL default '0',
  battle_challenger_def int(8) NOT NULL default '0',
  battle_challenger_magic_attack int(8) NOT NULL default '0',
  battle_challenger_magic_resistance int(8) NOT NULL default '0',
  battle_challenger_dmg int(8) NOT NULL default '0',
  battle_challenger_element int(3) NOT NULL default '0',
  battle_opponent_id int(8) NOT NULL default '0',
  battle_opponent_hp int(8) NOT NULL default '0',
  battle_opponent_mp int(8) NOT NULL default '0',
  battle_opponent_att int(8) NOT NULL default '0',
  battle_opponent_def int(8) NOT NULL default '0',
  battle_opponent_magic_attack int(8) NOT NULL default '0',
  battle_opponent_magic_resistance int(8) NOT NULL default '0',
  battle_opponent_mp_power int(8) NOT NULL default '0',
  battle_opponent_sp int(12) NOT NULL default '0',
  battle_opponent_dmg int(8) NOT NULL default '0',
  battle_opponent_hp_max int(8) NOT NULL default '0',
  battle_opponent_mp_max int(8) NOT NULL default '0',
  battle_opponent_element int(3) NOT NULL default '0',
  PRIMARY KEY  (battle_id)
) Engine=InnoDB;

CREATE TABLE adr_battle_monsters (
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

CREATE TABLE adr_battle_pvp (
  battle_id int(8) NOT NULL auto_increment,
  battle_turn int(8) NOT NULL default '0',
  battle_result tinyint(1) NOT NULL default '0',
  battle_text text NOT NULL,
  battle_text_chat text NOT NULL,
  battle_start int(12) NOT NULL default '0',
  battle_finish int(12) NOT NULL default '0',
  battle_challenger_id int(8) NOT NULL default '0',
  battle_challenger_att int(8) NOT NULL default '0',
  battle_challenger_def int(8) NOT NULL default '0',
  battle_challenger_hp int(8) NOT NULL default '0',
  battle_challenger_mp int(8) NOT NULL default '0',
  battle_challenger_hp_max int(8) NOT NULL default '0',
  battle_challenger_mp_max int(8) NOT NULL default '0',
  battle_challenger_hp_regen int(8) NOT NULL default '0',
  battle_challenger_mp_regen int(8) NOT NULL default '0',
  battle_challenger_dmg int(8) NOT NULL default '0',
  battle_challenger_magic_attack int(8) NOT NULL default '0',
  battle_challenger_magic_resistance int(8) NOT NULL default '0',
  battle_challenger_element int(3) NOT NULL default '0',
  battle_opponent_id int(8) NOT NULL default '0',
  battle_opponent_att int(8) NOT NULL default '0',
  battle_opponent_def int(8) NOT NULL default '0',
  battle_opponent_hp int(8) NOT NULL default '0',
  battle_opponent_mp int(8) NOT NULL default '0',
  battle_opponent_hp_max int(8) NOT NULL default '0',
  battle_opponent_mp_max int(8) NOT NULL default '0',
  battle_opponent_hp_regen int(8) NOT NULL default '0',
  battle_opponent_mp_regen int(8) NOT NULL default '0',
  battle_opponent_dmg int(8) NOT NULL default '0',
  battle_opponent_magic_attack int(8) NOT NULL default '0',
  battle_opponent_magic_resistance int(8) NOT NULL default '0',
  battle_opponent_element int(3) NOT NULL default '0',
  PRIMARY KEY  (battle_id)
) Engine=InnoDB;

CREATE TABLE adr_characters (
  character_id int(8) NOT NULL default '0',
  character_name varchar(255) NOT NULL default '',
  character_desc text NOT NULL,
  character_race int(8) NOT NULL default '0',
  character_class int(8) NOT NULL default '0',
  character_alignment int(8) NOT NULL default '0',
  character_element int(8) NOT NULL default '0',
  character_hp int(8) NOT NULL default '0',
  character_hp_max int(8) NOT NULL default '0',
  character_mp int(8) NOT NULL default '0',
  character_mp_max int(8) NOT NULL default '0',
  character_ac int(8) NOT NULL default '0',
  character_xp int(11) NOT NULL default '0',
  character_level int(8) NOT NULL default '1',
  character_might int(8) NOT NULL default '0',
  character_dexterity int(8) NOT NULL default '0',
  character_constitution int(8) NOT NULL default '0',
  character_intelligence int(8) NOT NULL default '0',
  character_wisdom int(8) NOT NULL default '0',
  character_charisma int(8) NOT NULL default '0',
  character_birth int(12) NOT NULL default '1093694853',
  character_limit_update int(8) NOT NULL default '1',
  character_battle_limit int(3) NOT NULL default '20',
  character_skill_limit int(3) NOT NULL default '30',
  character_trading_limit int(3) NOT NULL default '30',
  character_thief_limit int(3) NOT NULL default '10',
  character_sp int(12) NOT NULL default '0',
  character_magic_attack int(8) NOT NULL default '10',
  character_magic_resistance int(8) NOT NULL default '10',
  character_warehouse tinyint(1) NOT NULL default '0',
  character_warehouse_update int(8) NOT NULL default '0',
  character_shop_update int(8) NOT NULL default '0',
  character_skill_mining int(8) UNSIGNED NOT NULL default '0',
  character_skill_stone int(8) UNSIGNED NOT NULL default '0',
  character_skill_forge int(8) UNSIGNED NOT NULL default '0',
  character_skill_enchantment int(8) UNSIGNED NOT NULL default '0',
  character_skill_trading int(8) UNSIGNED NOT NULL default '0',
  character_skill_thief int(8) UNSIGNED NOT NULL default '0',
  character_skill_mining_uses int(8) UNSIGNED NOT NULL default '0',
  character_skill_stone_uses int(8) UNSIGNED NOT NULL default '0',
  character_skill_forge_uses int(8) UNSIGNED NOT NULL default '0',
  character_skill_enchantment_uses int(8) UNSIGNED NOT NULL default '0',
  character_skill_trading_uses int(8) UNSIGNED NOT NULL default '0',
  character_skill_thief_uses int(8) UNSIGNED NOT NULL default '0',
  character_victories int(8) NOT NULL default '0',
  character_defeats int(8) NOT NULL default '0',
  character_flees int(8) NOT NULL default '0',
  prefs_pvp_notif_pm tinyint(1) NOT NULL default '1',
  prefs_pvp_allow tinyint(1) NOT NULL default '1',
  prefs_tax_pm_notify TINYINT(1) NOT NULL default '1',
  equip_armor int(8) NOT NULL default '0',
  equip_buckler int(8) NOT NULL default '0',
  equip_helm int(8) NOT NULL default '0',
  equip_gloves int(8) NOT NULL default '0',
  equip_amulet int(8) NOT NULL default '0',
  equip_ring int(8) NOT NULL default '0',
  character_pref_give_pm int(1) NOT NULL default '1',
  character_pref_seller_pm int(1) NOT NULL default '1', 
  character_double_ko int(8) NOT NULL default '0',
  character_victories_pvp int(8) NOT NULL default '0',
  character_defeats_pvp int(8) NOT NULL default '0',
  character_flees_pvp int(8) NOT NULL default '0',
  character_fp int(12) NOT NULL default '0',
  PRIMARY KEY  (character_id)
) Engine=InnoDB;


CREATE TABLE adr_stores_stats(
  store_stats_character_id int(12) NOT NULL default '0',
  store_stats_store_id int(12) NOT NULL default '0',
  store_stats_buy_total int(12) NOT NULL default '0',
  store_stats_buy_last int(12) NOT NULL default '0',
  store_stats_sold_total int(12) NOT NULL default '0',
  store_stats_sold_last int(12) NOT NULL default '0',
  store_stats_stolen_item_total int(12) NOT NULL default '0',
  store_stats_stolen_item_fail_total int(12) NOT NULL default '0',
  store_stats_stolen_item_last int(12) NOT NULL default '0',
  store_stats_stolen_points_total int(12) NOT NULL default '0',
  store_stats_stolen_points_last int(12) NOT NULL default '0',
  PRIMARY KEY  (store_stats_character_id, store_stats_store_id)
) Engine=InnoDB;

CREATE TABLE adr_stores_user_history(
  user_store_trans_id int(12) NOT NULL default '0',
  user_store_owner_id int(8) NOT NULL default '0',
  user_store_info TEXT NOT NULL default '',
  user_store_total_price int(12) NOT NULL default '0',
  user_store_date int(12) NOT NULL default '0',
  user_store_buyer TEXT NOT NULL default '',
  PRIMARY KEY(user_store_trans_id, user_store_owner_id)
) Engine=InnoDB;




CREATE TABLE adr_vault_blacklist (
  user_id int(8) NOT NULL default '0',
  user_due int(8) NOT NULL default '0',
  PRIMARY KEY  (user_id)
) Engine=InnoDB;

CREATE TABLE adr_vault_exchange_users (
  stock_id mediumint(8) NOT NULL default '0',
  user_id mediumint(8) NOT NULL default '0',
  stock_amount mediumint(8) NOT NULL default '0',
  KEY stock_id (stock_id),
  KEY user_id (user_id)
) Engine=InnoDB;

CREATE TABLE adr_vault_users (
  owner_id int(8) NOT NULL default '0',
  account_id int(8) NOT NULL default '0',
  account_sum int(8) NOT NULL default '0',
  account_time int(11) NOT NULL default '0',
  loan_sum int(8) NOT NULL default '0',
  loan_time int(11) NOT NULL default '0',
  account_protect tinyint(1) NOT NULL default '0',
  loan_protect tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (owner_id)
) Engine=InnoDB;

CREATE TABLE adr_jail_users (
  celled_id int(8) NOT NULL default '0',
  user_id int(8) NOT NULL default '0',
  user_cell_date int(11) NOT NULL default '0',
  user_freed_by int(8) NOT NULL default '0',
  user_sentence text,
  user_caution int(8) NOT NULL default '0',
  user_time int(11) NOT NULL default '0',
  PRIMARY KEY  (celled_id)
) Engine=InnoDB;

CREATE TABLE adr_jail_votes (
  vote_id mediumint(8) NOT NULL default '0',
  voter_id mediumint(8) NOT NULL default '0',
  vote_result mediumint(8) NOT NULL default '0',
  KEY vote_id (vote_id),
  KEY voter_id (voter_id)
) Engine=InnoDB;

#CREATE TABLE adr_create_exploit_fix (
  #user_id int(10) NOT NULL default '0',
  #power int(8) NOT NULL default '0',
  #agility int(8) NOT NULL default '0',
  #endurance int(8) NOT NULL default '0',
  #intelligence int(8) NOT NULL default '0',
  #willpower int(8) NOT NULL default '0',
  #charm int(8) NOT NULL default '0',
  #magic_attack int(8) NOT NULL default '0',
  #magic_resistance int(8) NOT NULL default '0',
  #PRIMARY KEY  (user_id)
#) Engine=InnoDB;

CREATE TABLE adr_battle_community(
  chat_id int(10) NOT NULL auto_increment,
  chat_posts int(10) NOT NULL default '0',
  chat_text text,
  chat_date date default NULL,
  PRIMARY KEY (chat_id)
) Engine=InnoDB;

#CREATE TABLE adr_bug_fix(
  #fix_id varchar(255) NOT NULL default '',
  #fix_install_date int(12) NOT NULL default '0',
  #fix_installed_by varchar(255) NOT NULL default '',
  #PRIMARY KEY(fix_id)
#) Engine=InnoDB;

