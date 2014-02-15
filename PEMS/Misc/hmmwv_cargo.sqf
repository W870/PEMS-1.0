//Crashed HMMWV Cargo for PEMS SM5 by Firefly, original random loot code by Maca. 


private ["_weaponcargo", ,"_magazinecargo", "_weaponcargoamount", "_magazinecargoamount", "_backpacks", "_hmmwv", "_item"];

_hmmwv = _this select 0;

_weaponcargo = 	[
			[	
				["AK_107_pso","AK_107_GL_pso","AK_107_kobra","AK_107_GL_kobra","AK_74_GL_kobra","AKS_74_kobra","AKS_74_pso","AKS_74_UN_kobra","M16A4","M16A4_ACG","M16A4_ACG_GL", 
				"M4A1_Aim","M4A1_HWS_GL","M4A1_HWS_GL_camo","M4A1_RCO_GL","M4A3_CCO_EP1","M4A3_RCO_GL_EP1","M4A1_AIM_SD_camo","M4A1_HWS_GL_SD_Camo","M4SPR","G36a","G36A_camo", 
				"G36K","G36K_camo","G36_C_SD_eotech","G36_C_SD_camo","SCAR_L_STD_HOLO","SCAR_L_STD_Mk4CQT","SCAR_L_STD_EGLM_RCO","SCAR_L_CQC_Holo","SCAR_L_CQC_EGLM_Holo", 
				"SCAR_L_CQC_CCO_SD","BAF_L85A2_RIS_Holo","BAF_L85A2_UGL_Holo","BAF_L85A2_RIS_SUSAT","BAF_L85A2_UGL_SUSAT","BAF_L85A2_RIS_ACOG","M8_compact","M8_carbine","M8_carbineGL",
				"M8_sharpshooter","Sa58V_RCO_EP1","Sa58V_CCO_EP1","FN_FAL_ANPVS4","SCAR_H_CQC_CCO","SCAR_H_STD_EGLM_Spect","SCAR_H_CQC_CCO_SD","M14_EP1","M110_NVG_EP1","SCAR_H_LNG_Sniper_SD",
				"SCAR_H_LNG_Sniper","SCAR_H_LNG_Sniper","M24","M24_des_EP1","M40A3","DMR","BAF_LRR_scoped","BAF_LRR_scoped_W","M107","BAF_AS50_scoped","SVD","SVD_CAMO","SVD_des_EP1""SVD_NSPU_EP1",
				"VSS_Vintorez","KSVK_DZE","MG36","MG36_camo","M8_SAW","BAF_L86A2_ACOG","RPK_74","M249_DZ","M249_EP1_DZ","M249_m145_EP1_DZE","M240_DZ","m240_scoped_EP1_DZE","MK_48_DZ","M60A4_EP1_DZE",
				"Pecheneg_DZ","MAAWS","Binocular_Vector","ItemToolbox","ItemEtool","ItemCrowbar","ItemKnife","ItemMatchbox","ItemCompass","NVGoggles","ItemGPS","ItemSledge","ChainSaw"]
			],
			];		
			
_magazinecargo = [
			[	
				["ItemBandage","ItemMorphine","ItemAntibiotic","ItemBloodbag", "ItemEpinephrine","ItemPainkiller","ItemWaterbottle","FoodCanBakedBeans","bulk_ItemSodaPepsiFull","bulk_FoodbaconCookedFull",
				"Skin_Sniper1_DZ","Skin_GUE_Soldier_Sniper_DZ","1Rnd_HE_M203","ItemTentDomed2","PartPlywoodPack","PartPlankPack""bulk_PartGenericHalf""bulk_ItemWireHalf","bulk_ItemTankTrapHalf",
				"bulk_ItemSandbag","CinderBlocks","MortarBucket","ItemFuelPump","ItemFuelBarrel","ItemComboLock","PartEngine","PartFueltank","PartGeneric","PartGlass","PartVRotor","PartWheel",
				"ItemMixOil","ItemGenerator","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_545x39_AK","30Rnd_545x39_AKSD","30Rnd_762x39_AK47",
				"20Rnd_762x51_FNFAL","10Rnd_762x54_SVD","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_86x70_L115A1","20Rnd_762x51_B_SCAR","20Rnd_762x51_SB_SCAR","10Rnd_127x99_m107","5Rnd_127x99_AS50",
				"20Rnd_9x39_SP5_VSS","5Rnd_127x108_KSVK","200Rnd_556x45_M249","100Rnd_556x45_M249","100Rnd_762x51_M240","75Rnd_545x39_RPK","100Rnd_556x45_BetaCMag","100Rnd_762x54_PK","MAAWS_HEDP",]
			],
			];	

_backpacks =["DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_GunBag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1","DZ_LargeGunBag_EP1"];			
			
_weaponcargoamount = 4;
_magazinecargoamount = 50;

// Add Cargo Weapons
for "_x" from 1 to _weaponcargoamount do {
	private ["_type", "_items"];
	_type = round(random 1);
	_items = _weaponcargo select _type;
	_item = _items call BIS_fnc_selectRandom;
	if (_type == 0) then {
		_hmmwv addWeaponCargoGlobal [_item,1];
		};

// Add Cargo Weapons
for "_x" from 1 to _magazinecargoamount do {
	private ["_type", "_items"];
	_type = round(random 1);
	_items = _magazinecargo select _type;
	_item = _items call BIS_fnc_selectRandom;
	if (_type == 0) then {
		_hmmwv addWeaponCargoGlobal [_item,1];
		};		
_hmmwv addBackpackCargoGlobal [_backpacks, 2] call BIS_fnc_selectRandom;
};

