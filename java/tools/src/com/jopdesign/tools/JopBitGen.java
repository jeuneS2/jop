/*
 * Created on Jan 31, 2004
 *
 * Generates a binary file from the output of JOP JavaCodeCompact
 * 
 */
package com.jopdesign.tools;

import java.io.*;

/**
 * @author Ed Anuff
 *
 */
public class JopBitGen {
	
	String srcfile;
	String dstfile;
	
	public JopBitGen(String srcfile, String dstfile) {
		this.srcfile = srcfile;
		this.dstfile = dstfile;
	}
	
	public void process() {
		try {
			int wc = 0;
			
			System.out.println("Jop binary file generator");
			System.out.println("Input file: " + srcfile);
			System.out.println("Output file: " + dstfile);
			
			FileReader fr = new FileReader(srcfile);
			StreamTokenizer st = new StreamTokenizer(fr);
			
			FileOutputStream fos = new FileOutputStream(dstfile);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			
			PrintWriter pw = new PrintWriter(new FileWriter(dstfile + ".txt"));

			st.eolIsSignificant(true);
			st.slashStarComments(true);
			st.slashSlashComments(true);
			st.lowerCaseMode(true);
			st.parseNumbers();

		
			while (st.nextToken() != StreamTokenizer.TT_EOF)
			{
				if  (st.ttype == StreamTokenizer.TT_NUMBER) {
					int w = (new Double(st.nval)).intValue();
					writeInt(w, bos);
					pw.println(Integer.toHexString(wc) + "=" + Integer.toHexString(w) + ";");
					wc++;
				}
			}
			
			pw.close();
			bos.flush();
			bos.close();
			fr.close();
			
			System.out.println(wc + " words written.");
	
	} catch (IOException e) {
			System.out.println(e.getMessage());
			System.exit(-1);
		}
		
	}

	 private void writeInt(int w, OutputStream o) throws IOException {
		for (int i = 0; i < 4; ++i) {
			int b = (w >>> ((3 - i) * 8)) & 0xFF;
			o.write(b);
		}
	}
	
	public static void main(String[] args) {
		if (args.length != 2) {
			System.out.println("usage: java JopBitGen srcfile.bin dstfile.bit");
			System.exit(-1);
		}

		JopBitGen jbg = new JopBitGen(args[0], args[1]);
		jbg.process();
		
	}
}
