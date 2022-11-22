
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;

import java.io.IOException;
import java.io.OutputStream;
import javax.swing.JTextArea;

/**
 *
 * @author La Văn Khánh
 */
public class TextAreaOutputStream extends OutputStream {
        private javax.swing.JTextArea jTextArea2;

        /**
         * Creates a new instance of TextAreaOutputStream which writes
         * to the specified instance of javax.swing.JTextArea control.
         *
         * @param textArea   A reference to the javax.swing.JTextArea
         *                  control to which the output must be redirected to.
         */
        public TextAreaOutputStream( JTextArea textArea ) {
            this.jTextArea2 = textArea;
        }

        public void write( int b ) throws IOException {
            jTextArea2.append( String.valueOf( ( char )b ) );
            jTextArea2.setCaretPosition(jTextArea2.getDocument().getLength());
        }

        public void write(char[] cbuf, int off, int len) throws IOException {
            jTextArea2.append(new String(cbuf, off, len));
            jTextArea2.setCaretPosition(jTextArea2.getDocument().getLength());
        }
    }
