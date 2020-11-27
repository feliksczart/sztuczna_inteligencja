package com.sample;

import java.util.ArrayList;
import org.kie.api.KieServices;
import org.kie.api.runtime.rule.QueryResults;
import org.kie.api.runtime.rule.QueryResultsRow;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
//import org.kie.api.logger.*;

/**
 * This is a sample class to launch a rule.
 */
public class DroolsTest {

    public static final void main(String[] args) {
        try {
            // load up the knowledge base
	        KieServices ks = KieServices.Factory.get();
    	    KieContainer kContainer = ks.getKieClasspathContainer();
        	KieSession kSession = kContainer.newKieSession("ksession-rules");
        	kSession.fireAllRules();
        	QueryResults results = kSession.getQueryResults( "wuja lub stryj" );
        	
        	for (QueryResultsRow row : results) {
        		Relacja relacja = (Relacja) row.get( "r" );
        		System.out.println( relacja.osoby[0] + " " + relacja.osoby[1] );
        	}
            
        	Osoba he = new Osoba("He");
        	Osoba nio = new Osoba("Nio");
        	
        	Relacja rel = new Relacja(he,nio,"rodzic");
        	
        	System.out.println(he.relacje);
            
        } catch (Throwable t) {
            t.printStackTrace();
        }
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
