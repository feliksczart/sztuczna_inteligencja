package com.sample;

import java.util.ArrayList;
import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

public class DroolsTest {

	public static void main(String[] args) {
		KieServices ks = KieServices.Factory.get();
	    KieContainer kContainer = ks.getKieClasspathContainer();
    	KieSession kSession = kContainer.newKieSession("ksession-rules");
    	kSession.fireAllRules();

	}
	public static enum Plec {NIEZNANA,MEZCZYZNA,KOBIETA};

	public static class Osoba {
	        public String imie;
	        public Plec plec;
	        public ArrayList<Relacja> relacje;
	        
	        public Osoba(String imie) {
	                this.imie=imie;
	                this.plec=Plec.NIEZNANA;
	                this.relacje = new ArrayList<Relacja>();
	        }       

	        public String toString() {
	                return imie;
	        }
	}

	public static class Relacja {

	    public Osoba[] osoby=new Osoba[2];
	    public String relacja;

	    public Relacja(Osoba o1, Osoba o2, String relacja) {
	        this.osoby[0]=o1;
	        this.osoby[1]=o2;
	        this.relacja=relacja;
	        o1.relacje.add(this);
	        o2.relacje.add(this);
	    }   
	}
}
