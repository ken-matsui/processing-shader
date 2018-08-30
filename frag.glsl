uniform int times; // ProcessingÇ©ÇÁÇÃà¯êî
const float NEON_WIDTH = 80.0;

void main() {
	vec4 col = vec4(0, 0, 0, 1);

	for (int count = 0; count < 5; ++count) {

		//  ê≥å∑îgÅisinÅjÇégÇ¡ÇƒäÓèÄì_ÇåàÇﬂÇÈÅB// * ÇÕîgí∑
  		float h = sin(radians(gl_FragCoord.x * 2.7 + times)) + cos(radians(gl_FragCoord.x + times));
  		h *= 50.0;
  		h += 100 + count * 100;
 
  		//  cÇÕÅAç¿ïWÇ™îgå`ÇÃà íuÇ“Ç¡ÇΩÇËÇ≈Ç†ÇÍÇŒ1.0ÅBÇªÇ±Ç©ÇÁNEON_WIDTHÇÃîÕàÕì‡Ç≈Ç†ÇÍÇŒÅAãóó£Ç…âûÇ∂Çƒ1.0Å`0.0Ç∆Ç»ÇÈÅB
  		float t = abs(gl_FragCoord.y - h) / NEON_WIDTH;
  		float c = 1.0 - t;
 
  		//  åãâ Ç™0ÇÊÇËëÂÇ´ÇØÇÍÇŒÅAêFÇâ¡éZÇ∑ÇÈÅB
  		if(c > 0.0) {
    			c = pow(c, 3.0);
			vec3 rc;
			switch (count){
			case 0:
				rc = vec3(c, 0, 0);
				break;
			case 1:
				rc = vec3(0, 0, c);
				break;
			case 2:
				rc = vec3(0, c, 0);
				break;
			case 3:
				rc = vec3(c, 0, c);
				break;
            default:
                rc = vec3(c, c, c);
			}
    			col += vec4(rc, 1);
  		}
	}

  	gl_FragColor = vec4(col);
}
