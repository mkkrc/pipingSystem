
import numpy as np
import math

def hardy_cross_f(D, Q):
    e=0.26*10**-3
    p=1000.0
    v=0.001
    f=np.ones(len(D))
    for j in range (len(Q)):
        Re=(p*Q[j]*4)/(v*np.pi*D[j])
        f[j]=1/((-1.8)*math.log10(6.9/Re+(e/(3.7*pipes_D[j]))**1.11))**2
    return f  


def hardy_cross_r(f ,L, D):
   
    return 8.0*f*L/(9.81*np.power(np.pi, 2.0)*np.power(D, 5.0))


def hardy_cross_numerator(n, r, Q):

    return r*Q*np.power(np.absolute(Q), n-1)


def hardy_cross_denominator(n, r, Q):
   
    return n*r*np.power(np.absolute(Q), n-1)


def hardy_cross_flow_correction(numerator, denominator):
   
    return -1.0*numerator/denominator


def hardy_cross_loop_iteration(n, pipes_r, pipes_Q, pipes_name=None):
   
    numerator_sum= 0.0
    denominator_sum = 0.0
    for j in range(len(pipes_Q)):
        numerator_sum += hardy_cross_numerator(n, pipes_r[j], pipes_Q[j])
        denominator_sum += hardy_cross_denominator(n, pipes_r[j], pipes_Q[j])
       
    delta_Q= hardy_cross_flow_correction(numerator_sum, denominator_sum)
   
    # update flow
    for j in range(len(pipes_Q)):
        pipes_Q[j] += delta_Q
        # print "The flow in pipe %s is %f" % (pipes_name[j], pipes_Q[j])
       
    return pipes_Q

Q_quess_array = np.array([16.0, 11.0, 6.0, 1.0, 1.0, 7.0])/1000
pipes_Ln = np.array([145.0, 175.0, 115.0, 120.0, 135.0, 115.0])
equilevant_valve_L=1.067
pipes_L = pipes_Ln+2*equilevant_valve_L
pipes_D = np.ones(6)*0.15  
pipes_f = hardy_cross_f(pipes_D, Q_quess_array)
pipes_r = hardy_cross_r(pipes_f, pipes_L, pipes_D)
 
for j in range(len(pipes_L)):
    print ("Given f=%f, L=%f, D=%f, thus r=%f" % (pipes_f[j], pipes_Ln[j], pipes_D[j], pipes_r[j]))

print ("Soru burda")
one_number_array=(4,5,6)
one_Q_quess_array=np.array([-1.0, -1.0, 7.0])/1000
one_r_array = np.ones(6)
one_r_array[0] = pipes_r[3]+20/Q_quess_array[3]**2
one_r_array[1] = pipes_r[4]
one_r_array[2] = pipes_r[5]+20/Q_quess_array[5]**2
#check if any pipes in loop one are shared with loop two

two_number_array=(1,2,3,4)
two_Q_quess_array=np.array([16.0, -12.0, -8.0, 1.0])/1000
two_r_array = np.ones(6)
two_r_array[0] = pipes_r[0]
two_r_array[1] = pipes_r[1]
two_r_array[2] = pipes_r[2]+20/Q_quess_array[2]**2
two_r_array[3] = pipes_r[3]+20/Q_quess_array[3]**2

iteration=0
num_iterations = 10

while iteration< num_iterations:
    # one iteration for loop one
    one_Q_quess_array = hardy_cross_loop_iteration(2.0, one_r_array, one_Q_quess_array, one_number_array)
   
    two_Q_quess_array[3] = (-1.0)*one_Q_quess_array[0]
   
    two_Q_quess_array = hardy_cross_loop_iteration(2.0, two_r_array, two_Q_quess_array, two_number_array)

    one_Q_quess_array[0] = (-1.0)*two_Q_quess_array[3]
   
    Q_quess_array[0]=np.absolute(two_Q_quess_array[0])
    Q_quess_array[1]=np.absolute(two_Q_quess_array[1])
    Q_quess_array[2]=np.absolute(two_Q_quess_array[2])
    Q_quess_array[3]=np.absolute(two_Q_quess_array[3])
    Q_quess_array[4]=np.absolute(one_Q_quess_array[1])
    Q_quess_array[5]=np.absolute(one_Q_quess_array[2])
    pipes_f = hardy_cross_f(pipes_D, Q_quess_array)
    pipes_r = hardy_cross_r(pipes_f, pipes_L, pipes_D)
    if one_Q_quess_array[0]<0:
        one_r_array[0] = pipes_r[3]+20/Q_quess_array[3]**2
        two_r_array[3] = pipes_r[3]+20/Q_quess_array[3]**2
    else:
        one_r_array[0] = pipes_r[3]-20/Q_quess_array[3]**2
        two_r_array[3] = pipes_r[3]-20/Q_quess_array[3]**2
    one_r_array[1] = pipes_r[4]
    one_r_array[2] = pipes_r[5]+20/Q_quess_array[5]**2
    two_r_array[0] = pipes_r[0]
    two_r_array[1] = pipes_r[1]
    two_r_array[2] = pipes_r[2]+20/Q_quess_array[2]**2

    iteration += 1

print("Calculations are complete")
print("Loop one:")
for j in range(len(one_Q_quess_array)):
    print("Pipe %d flow: %f" % (one_number_array[j], one_Q_quess_array[j]))
print("Loop two:")    
for j in range(len(two_Q_quess_array)):
    print ("Pipe %d flow: %f" % (two_number_array[j], two_Q_quess_array[j]))

hl=0
wl=0
for j in range(len(Q_quess_array)):
    hl += pipes_r[j]*Q_quess_array[j]**2
    wl += hl*Q_quess_array[j]
L7=60
L8=115
D7=D8=np.array([0.15])
Q7=Q8=D7=D8=np.array([27])
f7 = hardy_cross_f(D7, Q7)
f8 = hardy_cross_f(D8, Q8)
r7 = hardy_cross_r(f7, L7, D7)
r8 = hardy_cross_r(f8, L8, D8)
hl7 = r7*Q7**2
hl8 = r8*Q8**2
wl7 = hl7*Q7
wl8 = hl8*Q8
wl += wl7+wl8
wt=wl+40*(4+8)/1000+20*(8+8)/1000
H=wt/(27/1000)
watt = 1000*9.81*(27/1000)*H
print(watt)
print(H)
