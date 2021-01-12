package com.sample;

import java.util.ArrayList;
import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

public class DroolsTest {

	public static void main(String[] args) {
		try {
            // load up the knowledge base
	        KieServices ks = KieServices.Factory.get();
    	    KieContainer kContainer = ks.getKieClasspathContainer();
        	KieSession kSession = kContainer.newKieSession("ksession-rules");
        	kSession.fireAllRules();
            
        } catch (Throwable t) {
            t.printStackTrace();
        }

	}
	
	
}