package cmp;

import java.util.Hashtable;
import jbe.LowLevel;
import com.jopdesign.sys.Const;
import com.jopdesign.sys.Native;


public class HashtableBenchCMP8{

	// Shared Variables
	public static int signal = 0; 
	public static Hashtable htable;
	public static DataClass[] data;
	public static int max = 256;
	static Object lock;
	
	public static void main(String[] args) {		
		
		int cpu_id;
		cpu_id = Native.rdMem(Const.IO_CPU_ID);
		
		if (cpu_id == 0x00000000)
		{
			// Initialization for benchmarking 
			int start = 0;
			int stop = 0;
			int time = 0;
			
			// Initialize the data Array 
			String string = new String("Test");
			data = new DataClass[max];
			
			for (int i=0; i<max; i++) 
			{
				data[i] = new DataClass(new Integer(i), string + i);
			}
			
			htable = new Hashtable(max);
			
			System.out.println("Application benchmarks:");
			
			start = LowLevel.timeMillis();
					
			// Start CPUs
			Native.wrMem(0x00000001, Const.IO_SIGNAL);
			
			// Fill Hashtable
			for (int j=0; j<(max/8); j++)
			{
				if (htable.containsKey(data[j].key)) {
				} else {
					htable.put(data[j].key, data[j].value);
				}
			}
			
			// Read Table
			for (int i=0; i<max/8; i++)
			{
				if (htable.contains(string + i))
				{
					data[i].value = (String)htable.get(data[i].key);
				}
			}
			
			// Delete Hashtable
			for (int i=0; i<(max/8); i++)
			{
				if (htable.containsKey(data[i].key))
				{
					htable.remove(data[i].key);
				}
			}

			while(true){
				util.Timer.usleep(500);
				synchronized(lock)
				{
					if (signal == 7)
						break;
				}
			}

			stop = LowLevel.timeMillis();
			
			System.out.println("StartTime: " + start);
			System.out.println("StopTime: " + stop);
			time = stop-start;
			System.out.println("TimeSpent: " + time);

		} 
		else                                       
		{		                                   
			if (cpu_id == 0x00000001)            
			{
				startCPU1();
			}  
			else
			{
				if (cpu_id == 0x00000002)            
				{
					startCPU2();
				}  
				else
				{
					if (cpu_id == 0x00000003)            
					{
						startCPU3();
					}
					else
					{
						if (cpu_id == 0x00000004)            
						{
							startCPU4();
						}  
						else
						{
							if (cpu_id == 0x00000005)            
							{
								startCPU5();
							}  
							else
							{
								if (cpu_id == 0x00000006)            
								{
									startCPU6();
								}  
								else
								{
									if (cpu_id == 0x00000007)            
									{
										startCPU7();
									}  
								}
							}
						}
					}
				}
			}
		}
	}
	
	static void startCPU1()
	{
		String string = new String("Test");
		// Fill Hashtable
		for (int j=max/8; j<max/4; j++)
		{
			if (htable.containsKey(data[j].key)) {
			} else {
				htable.put(data[j].key, data[j].value);
			}
		}
		
		// Read Table
		for (int i=max/8; i<max/4; i++)
		{
			if (htable.contains(string + i))
			{
				data[i].value = (String)htable.get(data[i].key);
			}
		}
		
		// Delete Hashtable
		for (int i=(max/8); i<max/4; i++)
		{
			if (htable.containsKey(data[i].key))
			{
				htable.remove(data[i].key);
			}
		}		
		synchronized(lock){
			signal++;}
		
		while(true);
	}
	
	static void startCPU2()
	{
		String string = new String("Test");
		// Fill Hashtable
		for (int j=max/4; j<(3*max/8); j++)
		{
			if (htable.containsKey(data[j].key)) {
			} else {
				htable.put(data[j].key, data[j].value);
			}
		}
		
		// Read Table
		for (int i=max/4; i<(3*max/8); i++)
		{
			if (htable.contains(string + i))
			{
				data[i].value = (String)htable.get(data[i].key);
			}
		}
		
		// Delete Hashtable
		for (int i=max/4; i<(3*max/8); i++)
		{
			if (htable.containsKey(data[i].key))
			{
				htable.remove(data[i].key);
			}
		}
	
		synchronized(lock){
			signal++;}
		
		while(true);
	}
	
	static void startCPU3()
	{
		String string = new String("Test");
		// Fill Hashtable
		for (int j=(3*max/8); j<max/2; j++)
		{
			if (htable.containsKey(data[j].key)) {
			} else {
				htable.put(data[j].key, data[j].value);
			}
		}
		
		// Read Table
		for (int i=(3*max/8); i<max/2; i++)
		{
			if (htable.contains(string + i))
			{
				data[i].value = (String)htable.get(data[i].key);
			}
		}
		
		// Delete Hashtable
		for (int i=(3*max/8); i<max/2; i++)
		{
			if (htable.containsKey(data[i].key))
			{
				htable.remove(data[i].key);
			}
		}
	
		synchronized(lock){
			signal++;}
		
		while(true);
	}
	
	static void startCPU4()
	{
		String string = new String("Test");
		// Fill Hashtable
		for (int j=max/2; j<(5*max/8); j++)
		{
			if (htable.containsKey(data[j].key)) {
			} else {
				htable.put(data[j].key, data[j].value);
			}
		}
		
		// Read Table
		for (int i=max/2; i<(5*max/8); i++)
		{
			if (htable.contains(string + i))
			{
				data[i].value = (String)htable.get(data[i].key);
			}
		}
		
		// Delete Hashtable
		for (int i=(max/2); i<(5*max/8); i++)
		{
			if (htable.containsKey(data[i].key))
			{
				htable.remove(data[i].key);
			}
		}		
		synchronized(lock){
			signal++;}
		
		while(true);
	}
	
	static void startCPU5()
	{
		String string = new String("Test");
		// Fill Hashtable
		for (int j=(5*max/8); j<(3*max/4); j++)
		{
			if (htable.containsKey(data[j].key)) {
			} else {
				htable.put(data[j].key, data[j].value);
			}
		}
		
		// Read Table
		for (int i=(5*max/8); i<(3*max/4); i++)
		{
			if (htable.contains(string + i))
			{
				data[i].value = (String)htable.get(data[i].key);
			}
		}
		
		// Delete Hashtable
		for (int i=(5*max/8); i<(3*max/4); i++)
		{
			if (htable.containsKey(data[i].key))
			{
				htable.remove(data[i].key);
			}
		}
	
		synchronized(lock){
			signal++;}
		
		while(true);
	}
	
	static void startCPU6()
	{
		String string = new String("Test");
		// Fill Hashtable
		for (int j=(3*max/4); j<(7*max/8); j++)
		{
			if (htable.containsKey(data[j].key)) {
			} else {
				htable.put(data[j].key, data[j].value);
			}
		}
		
		// Read Table
		for (int i=(3*max/4); i<(7*max/8); i++)
		{
			if (htable.contains(string + i))
			{
				data[i].value = (String)htable.get(data[i].key);
			}
		}
		
		// Delete Hashtable
		for (int i=(3*max/4); i<(7*max/8); i++)
		{
			if (htable.containsKey(data[i].key))
			{
				htable.remove(data[i].key);
			}
		}
	
		synchronized(lock){
			signal++;}
		
		while(true);
	}
	
	static void startCPU7()
	{
		String string = new String("Test");
		// Fill Hashtable
		for (int j=(7*max/8); j<max; j++)
		{
			if (htable.containsKey(data[j].key)) {
			} else {
				htable.put(data[j].key, data[j].value);
			}
		}
		
		// Read Table
		for (int i=(7*max/8); i<max; i++)
		{
			if (htable.contains(string + i))
			{
				data[i].value = (String)htable.get(data[i].key);
			}
		}
		
		// Delete Hashtable
		for (int i=(7*max/8); i<max; i++)
		{
			if (htable.containsKey(data[i].key))
			{
				htable.remove(data[i].key);
			}
		}
	
		synchronized(lock){
			signal++;}
		
		while(true);
	}
}
	