package edu.ben.cmsc398.model;

public class ModificationLookup {
	int modLookupId;
	String mod;
	public ModificationLookup(int modLookupId, String mod) {
		super();
		this.modLookupId = modLookupId;
		this.mod = mod;
	}
	public int getModLookupId() {
		return modLookupId;
	}
	public void setModLookupId(int modLookupId) {
		this.modLookupId = modLookupId;
	}
	public String getMod() {
		return mod;
	}
	public void setMod(String mod) {
		this.mod = mod;
	}
	@Override
	public String toString() {
		return "ModificationLookup [modLookupId=" + modLookupId + ", mod="
				+ mod + "]";
	}

	
}
