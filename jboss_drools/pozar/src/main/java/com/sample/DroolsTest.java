package com.sample;

import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.api.logger.*;

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
        	KieRuntimeLogger kLogger = ks.getLoggers().newFileLogger(kSession,  "test");

            // go !
             
            kSession.insert(new Straz());
            kSession.fireAllRules();
            
            kLogger.close();
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

   
    public static class Pomiar {
    	public boolean dym;
    	public int temperatura;
    	
    	public Pomiar(boolean dym, int temperatura) {
    		this.dym = dym;
    		this.temperatura = temperatura;
    	}
    	
    }
    
    public static class Pozar {}
    
    public static class Telefon {
    	public int number;
    	
    	public Telefon(int number) {
    		this.number = number;
    	}
    }
    
    public static class Straz {}
    
}
