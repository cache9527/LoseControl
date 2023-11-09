local L = "LoseControl"
local CC      = "CC"
local Silence = "Silence"
local Disarm  = "Disarm"
local Root    = "Root"
local Snare   = "Snare"
local Immune  = "Immune"
local PvE     = "PvE"

local Prio = {CC,Silence,Disarm,Root,Snare}
if GetLocale == enUS then
local spellIds = {
	-- Druid
	["Hibernate"] = CC, -- Hibernate
	["Starfire Stun"] = CC, -- Starfire
	["Entangling Roots"] = Root, -- Entangling Roots
	["Bash"] = CC, -- Bash
	["Pounce Bleed"] = CC, -- Pounce
	["Feral Charge Effect"] = Root, -- Feral Charge
	-- Hunter
	["Intimidation"] = CC, -- Intimidation
	["Scare Beast"] = CC, -- Scare Beast
	["Scatter Shot"] = CC, -- Scatter Shot
	["Improved Concussive Shot"] = CC, -- Improved Concussive Shot
	["Concussive Shot"] = Snare, -- Concussive Shot
	["Freezing Trap Effect"] = CC, -- Freezing Trap
	["Freezing Trap"] = CC, -- Freezing Trap
	["Frost Trap Aura"] = Root, -- Freezing Trap
	["Frost Trap"] = Root, -- Frost Trap
	["Entrapment"] = Root, -- Entrapment
	["Wyvern Sting"] = CC, -- Wyvern Sting; requires a hack to be removed later
	["Counterattack"] = Root, -- Counterattack
	["Improved Wing Clip"] = Root, -- Improved Wing Clip
	["Wing Clip"] = Snare, -- Wing Clip
	["Boar Charge"] = Root, -- Boar Charge
	-- Mage
	["Polymorph"] = CC, -- Polymorph: Sheep
	["Polymorph: Turtle"] = CC, -- Polymorph: Turtle
	["Polymorph: Pig"] = CC, -- Polymorph: Pig
	["Polymorph: Cow"] = CC, -- Polymorph: Cow
	["Polymorph: Chicken"] = CC, -- Polymorph: Chicken
	["Counterspell - Silenced"] = Silence, -- Counterspell
	["Impact"] = CC, -- Impact
	["Blast Wave"] = Snare, -- Blast Wave
	["Frostbite"] = Root, -- Frostbite
	["Frost Nova"] = Root, -- Frost Nova
	["Frostbolt"] = Snare, -- Frostbolt
	["Cone of Cold"] = Snare, -- Cone of Cold
	["Chilled"] = Snare, -- Improved Blizzard + Ice armor
	-- Paladin
	["Hammer of Justice"] = CC, -- Hammer of Justice
	["Repentance"] = CC, -- Repentance
	-- Priest
	["Mind Control"] = CC, -- Mind Control
	["Psychic Scream"] = CC, -- Psychic Scream
	["Blackout"] = CC, -- Blackout
	["Silence"] = Silence, -- Silence
	["Mind Flay"] = Snare, -- Mind Flay
	-- Rogue
	["Blind"] = CC, -- Blind
	["Cheap Shot"] = CC, -- Cheap Shot
	["Gouge"] = CC, -- Gouge
	["Kidney Shot"] = CC, -- Kidney shot; the buff is 30621
	["Sap"] = CC, -- Sap
	["Kick - Silenced"] = Silence, -- Kick
	["Crippling Poison"] = Snare, -- Crippling Poison
	-- Warlock
	["Death Coil"] = CC, -- Death Coil
	["Fear"] = CC, -- Fear
	["Howl of Terror"] = CC, -- Howl of Terror
	["Curse of Exhaustion"] = Snare, -- Curse of Exhaustion
	["Pyroclasm"] = CC, -- Pyroclasm
	["Aftermath"] = Snare, -- Aftermath
	["Seduction"] = CC, -- Seduction
	["Spell Lock"] = Silence, -- Spell Lock
	["Inferno Effect"] = CC, -- Inferno Effect
	["Inferno"] = CC, -- Inferno
	["Cripple"] = Snare, -- Cripple
	-- Warrior
	["Charge Stun"] = CC, -- Charge Stun
	["Intercept Stun"] = CC, -- Intercept Stun
	["Intimidating Shout"] = CC, -- Intimidating Shout
	["Revenge Stun"] = CC, -- Revenge Stun
	["Concussion Blow"] = CC, -- Concussion Blow
	["Piercing Howl"] = Snare, -- Piercing Howl
	["Shield Bash - Silenced"] = Silence, -- Shield Bash - Silenced
	--Shaman	
	["Frostbrand Weapon"] = Snare, -- Frostbrand Weapon
	["Frost Shock"] = Snare, -- Frost Shock
	["Earthbind"] = Snare, -- Earthbind
	["Earthbind Totem"] = Snare, -- Earthbind Totem
	-- other
	["War Stomp"] = CC, -- War Stomp
	["Tidal Charm"] = CC, -- Tidal Charm
	["Mace Stun Effect"] = CC, -- Mace Stun Effect
	["Stun"] = CC, -- Stun
	["Gnomish Mind Control Cap"] = CC, -- Gnomish Mind Control Cap
	["Reckless Charge"] = CC, -- Reckless Charge
	["Sleep"] = CC, -- Sleep
	["Dazed"] = Snare, -- Dazed
	["Freeze"] = Root, -- Freeze
	["Chill"] = Snare, -- Chill
	["Charge"] = CC, -- Charge
}
elseif GetLocale == zhCN then
local spellIds = {
	-- Druid
	["休眠"] = CC, -- Hibernate
	["星火昏迷"] = CC, -- Starfire
	["纠缠根须"] = Root, -- Entangling Roots
	["重击"] = CC, -- Bash
	["血袭"] = CC, -- Pounce
	["野性冲锋效果"] = Root, -- Feral Charge
	-- Hunter
	["胁迫"] = CC, -- Intimidation
	["恐吓野兽"] = CC, -- Scare Beast
	["驱散射击"] = CC, -- Scatter Shot
	["强化震荡射击"] = CC, -- Improved Concussive Shot
	["震荡射击"] = Snare, -- Concussive Shot
	["冰冻陷阱效果"] = CC, -- Freezing Trap
	["冰冻陷阱"] = CC, -- Freezing Trap
	["冰霜陷阱光环"] = Root, -- Freezing Trap
	["冰霜陷阱"] = Root, -- Frost Trap
	["诱捕"] = Root, -- Entrapment
	["翼龙钉刺"] = CC, -- Wyvern Sting; requires a hack to be removed later
	["反击"] = Root, -- Counterattack
	["强化摔绊"] = Root, -- Improved Wing Clip
	["摔绊"] = Snare, -- Wing Clip
	["野猪冲撞"] = Root, -- Boar Charge
	-- Mage
	["变形术"] = CC, -- Polymorph: Sheep
	["变形术：龟"] = CC, -- Polymorph: Turtle
	["变形术：猪"] = CC, -- Polymorph: Pig
	["变形术：奶牛"] = CC, -- Polymorph: Cow
	["变形术：鸡"] = CC, -- Polymorph: Chicken
	["法术反制 - 沉默"] = Silence, -- Counterspell
	["冲击"] = CC, -- Impact
	["冲击波"] = Snare, -- Blast Wave
	["霜寒刺骨"] = Root, -- Frostbite
	["冰霜新星"] = Root, -- Frost Nova
	["寒冰箭"] = Snare, -- Frostbolt
	["冰锥术"] = Snare, -- Cone of Cold
	["冰冻"] = Snare, -- Improved Blizzard + Ice armor
	-- Paladin
	["制裁之锤"] = CC, -- Hammer of Justice
	["忏悔"] = CC, -- Repentance
	-- Priest
	["精神控制"] = CC, -- Mind Control
	["心灵尖啸"] = CC, -- Psychic Scream
	["昏阙"] = CC, -- Blackout
	["沉默"] = Silence, -- Silence
	["精神鞭笞"] = Snare, -- Mind Flay
	-- Rogue
	["致盲"] = CC, -- Blind
	["偷袭"] = CC, -- Cheap Shot
	["凿击"] = CC, -- Gouge
	["肾击"] = CC, -- Kidney shot; the buff is 30621
	["闷棍"] = CC, -- Sap
	["脚踢 - 沉默"] = Silence, -- Kick
	["致残毒药"] = Snare, -- Crippling Poison
	-- Warlock
	["死亡缠绕"] = CC, -- Death Coil
	["恐惧术"] = CC, -- Fear
	["恐惧嚎叫"] = CC, -- Howl of Terror
	["疲劳诅咒"] = Snare, -- Curse of Exhaustion
	["火焰冲撞"] = CC, -- Pyroclasm
	["清算"] = Snare, -- Aftermath
	["诱惑"] = CC, -- Seduction
	["法术封锁"] = Silence, -- Spell Lock
	["地狱火效果"] = CC, -- Inferno Effect
	["地狱火"] = CC, -- Inferno
	["残废术"] = Snare, -- Cripple
	-- Warrior
	["冲锋击昏"] = CC, -- Charge Stun
	["拦截昏迷"] = CC, -- Intercept Stun
	["破胆怒吼"] = CC, -- Intimidating Shout
	["复仇昏迷"] = CC, -- Revenge Stun
	["震荡猛击"] = CC, -- Concussion Blow
	["刺耳怒吼"] = Snare, -- Piercing Howl
	["盾击 - 沉默"] = Silence, -- Shield Bash - Silenced
	--Shaman	
	["冰封武器"] = Snare, -- Frostbrand Weapon
	["冰霜震击"] = Snare, -- Frost Shock
	["地缚术"] = Snare, -- Earthbind
	["地缚图腾"] = Snare, -- Earthbind Totem
	-- other
	["战争践踏"] = CC, -- War Stomp
	["潮汐咒符"] = CC, -- Tidal Charm
	["锤击昏迷效果"] = CC, -- Mace Stun Effect
	["昏迷"] = CC, -- Stun
	["侏儒洗脑帽"] = CC, -- Gnomish Mind Control Cap
	["无畏冲锋"] = CC, -- Reckless Charge
	["催眠术"] = CC, -- Sleep
	["眩晕"] = Snare, -- Dazed
	["冰冻术"] = Root, -- Freeze
	["寒冷"] = Snare, -- Chill
	["冲锋"] = CC, -- Charge
	["冰爆术"] = CC, -- Ice Yeti
	["蹬踏"] = CC, -- Ashenvale Outrunner
	["鞭笞"] = CC, -- Lashtail Raptor
	["水晶凝视"] = CC, -- Crystal Spine Basilisk
	["蛛网"] = Root,      -- Carrion Lurker
	["恐吓"] = CC, -- Fr Pterrordax
	["恐吓尖啸"] = CC, -- Pterrordax
}
end

local wipe = function(t)
	for k,v in pairs(t) do
		t[k]=nil
	end
	return t
end

local ToggleDrag = function()
  if not LoseControlPlayer:IsMouseEnabled() then
  	LoseControlPlayer:EnableMouse(true)
  	LoseControlPlayer:RegisterForDrag("RightButton")
  	LoseControlPlayer:SetScript("OnDragStart",function() this:StartMoving() end)
  	LoseControlPlayer:SetScript("OnDragStop",function() this:StopMovingOrSizing() end)
  	LoseControlPlayer.texture:SetTexture(1,0,0,1)
  	LoseControlPlayer:Show()
  	DEFAULT_CHAT_FRAME:AddMessage("LoseControl: Drag with right button")
  else
  	LoseControlPlayer:RegisterForDrag(nil)
  	LoseControlPlayer:EnableMouse(false)
  	LoseControlPlayer:SetScript("OnDragStart",nil)
  	LoseControlPlayer:SetScript("OnDragStop",nil)
  	LoseControlPlayer.texture:SetTexture(nil)
  	LoseControlPlayer:Hide()
  	DEFAULT_CHAT_FRAME:AddMessage("LoseControl: Saved new position")
  end
end

function LCPlayer_OnLoad()	
	this:SetPoint("CENTER", 0, -60)
	this:RegisterEvent("UNIT_AURA")
	this:RegisterEvent("PLAYER_AURAS_CHANGED")
	this:RegisterEvent("VARIABLES_LOADED")

	this.texture = this:CreateTexture(this, "BACKGROUND")
	this.texture:SetAllPoints(this)
	this.cooldown = CreateFrame("Model", "Cooldown", this, "CooldownFrameTemplate")
	this.cooldown:SetAllPoints(this) 
	this.maxExpirationTime = 0
	this:Hide()
	this:EnableMouse(false)
	this:SetUserPlaced(true)
end

local trackedSpells = {}
local cachedTextures = {}
function LCPlayer_OnEvent()
	if event == "VARIABLES_LOADED" then
		LoseControlDB = LoseControlDB or {size=40}
		this:SetHeight(LoseControlDB.size)
		this:SetWidth(LoseControlDB.size)
		if IsAddOnLoaded("pfUI") then
			if pfUI.api ~= nil and type(pfUI.api.CreateBackdrop) == "function" then
				pfUI.api.CreateBackdrop(this)
				this:UnregisterEvent("VARIABLES_LOADED")
			end
		end
		return
	end
	trackedSpells = wipe(trackedSpells)
	local spellFound
	for i=1, 16 do -- 16 is enough due to HARMFUL filter
		local texture = UnitDebuff("player", i)
		LCTooltip:ClearLines()
		LCTooltip:SetUnitDebuff("player", i)
		local buffName = LCTooltipTextLeft1:GetText()
		if spellIds[buffName] ~= nil then
			if cachedTextures[buffName] == nil then cachedTextures[buffName] = texture end
			trackedSpells[table.getn(trackedSpells)+1] = buffName
		end
	end
	if table.getn(trackedSpells) > 1 then
		table.sort(trackedSpells,function(a,b)
				if Prio[spellIds[a]]~=nil and Prio[spellIds[b]]~=nil then
				return Prio[spellIds[a]] < Prio[spellIds[b]] end
				return a > b
			end)
	end
	spellFound = trackedSpells[1] -- highest prio spell
	if (spellFound) then
		for j=0, 31 do
			local buffTexture = GetPlayerBuffTexture(j)
			if cachedTextures[spellFound] == buffTexture then
				local expirationTime = GetPlayerBuffTimeLeft(j)
				this:Show()
				this.texture:SetTexture(buffTexture)
				this.cooldown:SetModelScale(this:GetEffectiveScale() or 1)
				if this.maxExpirationTime <= expirationTime then
					CooldownFrame_SetTimer(this.cooldown, GetTime(), expirationTime, 1)
					this.maxExpirationTime = expirationTime
				end
				return
			end
		end	
	end
	if spellFound == nil then
		this.maxExpirationTime = 0
		this:Hide()
	end
end

SLASH_LOSECONTROL1 = "/losecontrol"
SlashCmdList["LOSECONTROL"] = function(options)
  if not (options) or options == "" then
  	DEFAULT_CHAT_FRAME:AddMessage("/losecontrol unlock : toggles lock for dragging")
  	DEFAULT_CHAT_FRAME:AddMessage("/losecontrol size x : sets icons size to x (10-50)")
  else
    local option = {}
    for opt in string.gfind(options,"([^ ]+)") do
      table.insert(option,opt)
    end
    if table.getn(option) > 0 then
    	local command = string.lower(table.remove(option,1))
    	-- TODO: future options would go here (scale, prio, filter etc)
    	if command == "unlock" or command == "lock" then
    		ToggleDrag()
    	elseif command == "size" then
    		local newsize = tonumber(table.remove(option,1))
    		if (newsize) and newsize >= 10 and newsize <= 50 then
    			LoseControlPlayer:SetWidth(newsize)
    			LoseControlPlayer:SetHeight(newsize)
    			LoseControlDB.size = newsize
    		end
    	end
    end
  end
end

function LCTarget_OnLoad()
	
end

function LCTarget_OnEvent()
	
end
