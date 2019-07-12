# frozen_string_literal: true

json.character do
  json.id @character.character_id
  json.icon @character.icon
  json.name @character.name
  json.description @character.description
  json.birthday @character.birthday
  json.gender @character.gender
  json.security_status @character.security_status
  json.perception @character.perception
  json.memory @character.memory
  json.willpower @character.willpower
  json.intelligence @character.intelligence
  json.charisma @character.charisma
  json.wallet @character.wallet
  json.bonus_remaps @character.bonus_remaps
  json.last_remap_date @character.last_remap_date
  json.accrued_remap_cooldown_date @character.accrued_remap_cooldown_date

  if @character.race
    json.race do
      json.id @character.race.race_id
      json.name @character.race.name
    end
  end

  if @character.bloodline
    json.bloodline do
      json.id @character.bloodline.bloodline_id
      json.name @character.bloodline.name
    end
  end

  if @character.ancestry
    json.ancestry do
      json.id @character.ancestry.ancestry_id
      json.name @character.ancestry.name
    end
  end

  if @character.faction
    json.faction do
      json.id @character.faction.faction_id
      json.name @character.faction.name
    end
  end

  if @character.alliance
    json.alliance do
      json.id @character.alliance.alliance_id
      json.name @character.alliance.name
    end
  end

  if @character.corporation
    json.corporation do
      json.id @character.corporation.corporation_id
      json.name @character.corporation.name
    end
  end
end
