(analysis-summary
  :config (analysis-config
    :cmd (solutions/static/.venv/bin/static-sign)
    :analysis (analysis-info
      :name static-sign
      :version 1.0
      :group "Hasan Ahmed"
      :tags (static python)
      :system Linux-6.8.0-149-generic-x86_64-with-glibc2.35
    )
    :experiments (
      :"jpamb.cases.Arrays.arrayContent:()V" ()
      :"jpamb.cases.Arrays.arrayContentAboveMinus13:()V" ()
      :"jpamb.cases.Arrays.arrayFillUntilEqual:()V" ()
      :"jpamb.cases.Arrays.arrayInBounds:()V" ()
      :"jpamb.cases.Arrays.arrayIndexValue:(I)V" ()
      :"jpamb.cases.Arrays.arrayIsNull:()V" ()
      :"jpamb.cases.Arrays.arrayIsNullLength:()V" ()
      :"jpamb.cases.Arrays.arrayLength:()V" ()
      :"jpamb.cases.Arrays.arrayLoop:(I)V" ()
      :"jpamb.cases.Arrays.arrayNotEmpty:([I)V" ()
      :"jpamb.cases.Arrays.arrayOutOfBounds:()V" ()
      :"jpamb.cases.Arrays.arraySometimesNull:(I)V" ()
      :"jpamb.cases.Arrays.arraySpellsHello:([C)V" ()
      :"jpamb.cases.Arrays.arraySumIsLarge:([I)V" ()
      :"jpamb.cases.Arrays.arraySumIsLargeInt:(I)V" ()
      :"jpamb.cases.Arrays.binarySearch:(I)V" ()
      :"jpamb.cases.Arrays.secretThenDivide:([C)I" ()
      :"jpamb.cases.BitOperations.bitshiftLeft:(I)V" ()
      :"jpamb.cases.BitOperations.bitshiftRight:(I)V" ()
      :"jpamb.cases.BitOperations.bitshiftUnsignedRight:(I)V" ()
      :"jpamb.cases.BitOperations.bitwiseAnd:(II)V" ()
      :"jpamb.cases.BitOperations.bitwiseNot:(I)V" ()
      :"jpamb.cases.BitOperations.bitwiseOr:(II)V" ()
      :"jpamb.cases.BitOperations.drawInt:(I)V" ()
      :"jpamb.cases.BitOperations.xor:(II)V" ()
      :"jpamb.cases.Calls.allPrimesArePositive:(I)V" ()
      :"jpamb.cases.Calls.callsAssertFalse:()V" ()
      :"jpamb.cases.Calls.callsAssertFib:(I)V" ()
      :"jpamb.cases.Calls.callsAssertIf:(Z)V" ()
      :"jpamb.cases.Calls.callsAssertIfWithTrue:()V" ()
      :"jpamb.cases.Calls.callsAssertTrue:()V" ()
      :"jpamb.cases.Calls.callsBowtie:(II)I" ()
      :"jpamb.cases.Calls.callsCallChain:(II)I" ()
      :"jpamb.cases.Calls.callsCallCycle:(II)I" ()
      :"jpamb.cases.Calls.callsCallCycleFork:(II)I" ()
      :"jpamb.cases.Calls.callsCallCycleLoop:(II)I" ()
      :"jpamb.cases.Calls.callsCallCycleNext:(II)I" ()
      :"jpamb.cases.Calls.callsDiamond:(I)I" ()
      :"jpamb.cases.Calls.callsDumbbell:(II)I" ()
      :"jpamb.cases.Calls.callsTadpole:(II)I" ()
      :"jpamb.cases.Calls.callsWheel:(II)I" ()
      :"jpamb.cases.Calls.divideViaHelper:(I)I" ()
      :"jpamb.cases.Calls.divisionThroughHelper:(II)I" ()
      :"jpamb.cases.Dependent.badNormalizedDistance:(II)I" ()
      :"jpamb.cases.Dependent.combinedGuidance:(III)V" ()
      :"jpamb.cases.Dependent.compareEquality:(II)V" ()
      :"jpamb.cases.Dependent.divisionLoop:(I)V" ()
      :"jpamb.cases.Dependent.doubleIsAlwaysEven:(I)V" ()
      :"jpamb.cases.Dependent.normalizedDistance:(II)I" ()
      :"jpamb.cases.Dependent.safeDivByN:(I)I" ()
      :"jpamb.cases.Extended.safeDifferenceChain:(III)I" ()
      :"jpamb.cases.Extended.safeLoopAccumulation:(III)I" ()
      :"jpamb.cases.Extended.safeNestedLoopDivision:(III)I" ()
      :"jpamb.cases.Extended.safeSelectedDivisor:(ZIII)I" ()
      :"jpamb.cases.Extended.unsafeComputedRemainder:(IIIII)I" ()
      :"jpamb.cases.Extended.unsafeLoopOffsetDivisor:(IIII)I" ()
      :"jpamb.cases.Extended.unsafeModeDerivedDivisor:(IIII)I" ()
      :"jpamb.cases.Extended.unsafeNestedAffineDivisor:(IIIII)I" ()
      :"jpamb.cases.Extended.unsafeNestedLoopDivisor:(IIIII)I" ()
      :"jpamb.cases.Loops.decrementLoop:(I)V" ()
      :"jpamb.cases.Loops.doWhileDivision:(II)I" ()
      :"jpamb.cases.Loops.forLoopDivision:(II)I" ()
      :"jpamb.cases.Loops.forever:()V" ()
      :"jpamb.cases.Loops.loopRemainder:(II)I" ()
      :"jpamb.cases.Loops.multiplicationLoop:(I)V" ()
      :"jpamb.cases.Loops.nestedLoop:(I)V" ()
      :"jpamb.cases.Loops.neverAsserts:()V" ()
      :"jpamb.cases.Loops.neverDivides:()I" ()
      :"jpamb.cases.Loops.safeNestedBranchDivision:(III)I" ()
      :"jpamb.cases.Loops.terminates:()V" ()
      :"jpamb.cases.Loops.whileLoopDivision:(II)I" ()
      :"jpamb.cases.MagicConstants.computedIndex:(I)I" ()
      :"jpamb.cases.MagicConstants.derivedNull:(I)I" ()
      :"jpamb.cases.MagicConstants.loopAndEquality:(I)V" ()
      :"jpamb.cases.MagicConstants.loopDoubling:(I)V" ()
      :"jpamb.cases.MagicConstants.loopDoublingSafe:(I)V" ()
      :"jpamb.cases.MagicConstants.narrowEquality:(I)V" ()
      :"jpamb.cases.MagicConstants.rangeCondition:(I)V" ()
      :"jpamb.cases.MagicConstants.squareThreshold:(I)V" ()
      :"jpamb.cases.MagicConstants.squaredDivisor:(I)I" ()
      :"jpamb.cases.MagicConstants.sumReachesTarget:(I)V" ()
      :"jpamb.cases.MagicConstants.tableLookup:(I)I" ()
      :"jpamb.cases.MagicConstants.tableLookupSafe:(I)I" ()
      :"jpamb.cases.MagicConstants.twoParams:(II)I" ()
      :"jpamb.cases.MagicConstants.twoParamsSafe:(II)I" ()
      :"jpamb.cases.MagicConstants.unreachableRange:(I)V" ()
      :"jpamb.cases.Operators.branchRemainder:(ZI)I" ()
      :"jpamb.cases.Operators.directRemainder:(II)I" ()
      :"jpamb.cases.Operators.divisionChain:(IIII)I" ()
      :"jpamb.cases.Operators.multiplyForDivisor:(II)I" ()
      :"jpamb.cases.Operators.negatedDivisor:(I)I" ()
      :"jpamb.cases.Overflow.arrayIndexAfterOverflow:(I)I" ()
      :"jpamb.cases.Randomness.branchOverlap:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.compareInts:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.draw34Bits:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.drawDependsOnArg:(ILjpamb/utils/Smith;)I" ()
      :"jpamb.cases.Randomness.drawInCallee:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.drawInt:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.drawIntOverflow:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.loopUntilHeads:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.randomBranch:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.randomIndex:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.randomNull:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.spinOnTails:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Randomness.twoDraws:(Ljpamb/utils/Smith;)V" ()
      :"jpamb.cases.Simple.ConstantExtractionCheck:(ILjava/lang/String;)V" ()
      :"jpamb.cases.Simple.assertBoolean:(Z)V" ()
      :"jpamb.cases.Simple.assertFalse:()V" ()
      :"jpamb.cases.Simple.assertInteger:(I)V" ()
      :"jpamb.cases.Simple.assertPositive:(I)V" ()
      :"jpamb.cases.Simple.assertTrue:()V" ()
      :"jpamb.cases.Simple.branchDivision:(ZI)I" ()
      :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ()
      :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ()
      :"jpamb.cases.Simple.checkBeforeDivideByN:(I)I" ()
      :"jpamb.cases.Simple.directDivision:(II)I" ()
      :"jpamb.cases.Simple.divideByN:(I)I" ()
      :"jpamb.cases.Simple.divideByNMinus10054203:(I)I" ()
      :"jpamb.cases.Simple.divideByZero:()I" ()
      :"jpamb.cases.Simple.divideZeroByZero:(II)I" ()
      :"jpamb.cases.Simple.doNothing:()V" ()
      :"jpamb.cases.Simple.earlyReturn:()I" ()
      :"jpamb.cases.Simple.guardedDivision:(I)I" ()
      :"jpamb.cases.Simple.integerRangeBoundary:(I)V" ()
      :"jpamb.cases.Simple.justAdd:(II)I" ()
      :"jpamb.cases.Simple.justMulitply:(II)I" ()
      :"jpamb.cases.Simple.justReturn:()I" ()
      :"jpamb.cases.Simple.justReturnNothing:()V" ()
      :"jpamb.cases.Simple.multiError:(Z)I" ()
      :"jpamb.cases.Simple.nestedBranchDivision:(II)I" ()
      :"jpamb.cases.Simple.nestedConstantCoverage:(III)V" ()
      :"jpamb.cases.Simple.selectedDivisor:(ZII)I" ()
      :"jpamb.cases.Simple.subtractForDivisor:(II)I" ()
      :"jpamb.cases.Strings.checkComplexSequence:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Strings.checkExtension:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Strings.sayHello2:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Strings.sayHello3:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" ()
      :"jpamb.cases.Tricky.collatz:(I)V" ()
      :"jpamb.cases.advanced.CWE470.strict_safe_dispatcher:(Ljava/lang/String;)V" ()
      :"jpamb.cases.advanced.CWE470.unsafe_dispatcher:(Ljava/lang/String;)V" ()
      :"jpamb.cases.advanced.CWE470.weak_dispatcher:(Ljava/lang/String;)V" ()
      :"jpamb.cases.advanced.CWE502.blacklist_deserialization:(Ljava/lang/String;)V" ()
      :"jpamb.cases.advanced.CWE502.insecure_deserialization:(Ljava/lang/String;)V" ()
      :"jpamb.cases.advanced.CWE502.whitelist_deserialization:(Ljava/lang/String;)V" ()
    )
    :iterations 3
    :timeout 5.0
  )
  :results (
    :"jpamb.cases.Arrays.arrayContent:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94885100
          :relative 1.1747384336180562
        )
        :calibrates (6408586 6282231)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 95629802
          :relative 1.284395541018223
        )
        :calibrates (5872744 4063625)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89643169
          :relative 1.1682174373432477
        )
        :calibrates (5869342 6301756)
      ))
    :"jpamb.cases.Arrays.arrayContentAboveMinus13:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91263665
          :relative 1.1826438084868611
        )
        :calibrates (5945140 6041131)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86989096
          :relative 1.3318905674603392
        )
        :calibrates (4021059 4081165)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98349155
          :relative 1.175563819923739
        )
        :calibrates (6257741 6871415)
      ))
    :"jpamb.cases.Arrays.arrayFillUntilEqual:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91566659
          :relative 1.1919080720902142
        )
        :calibrates (5833984 5938261)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86415997
          :relative 1.3291788533655617
        )
        :calibrates (4020180 4079079)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 138701579
          :relative 1.2981437046093025
        )
        :calibrates (6580045 7382600)
      ))
    :"jpamb.cases.Arrays.arrayInBounds:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90507180
          :relative 1.184910888098481
        )
        :calibrates (5853183 5971844)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 85082964
          :relative 1.2211378972467133
        )
        :calibrates (4022889 6203792)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 95457255
          :relative 1.1120597250412507
        )
        :calibrates (7416266 7333299)
      ))
    :"jpamb.cases.Arrays.arrayIndexValue:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 103742400
          :relative 1.2443384618446096
        )
        :calibrates (5873147 5947679)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89122335
          :relative 1.1438724102310736
        )
        :calibrates (6389830 6408230)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94506044
          :relative 1.1111407149306216
        )
        :calibrates (7347985 7285537)
      ))
    :"jpamb.cases.Arrays.arrayIsNull:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90334841
          :relative 1.1734694203822023
        )
        :calibrates (6048391 6069188)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89026494
          :relative 1.145596152982288
        )
        :calibrates (6795258 5938398)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 139737964
          :relative 1.2911024970215106
        )
        :calibrates (7115657 7181244)
      ))
    :"jpamb.cases.Arrays.arrayIsNullLength:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87187014
          :relative 1.245387899131395
        )
        :calibrates (5836945 4073517)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88065497
          :relative 1.173909026642127
        )
        :calibrates (5875260 5925956)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98762837
          :relative 1.2356193619015363
        )
        :calibrates (7040717 4440930)
      ))
    :"jpamb.cases.Arrays.arrayLength:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 87417553
          :relative 1.2063753653641578
        )
        :calibrates (4043490 6827104)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 87803036
          :relative 1.173425650057536
        )
        :calibrates (5893431 5885717)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93233537
          :relative 1.3279364093572883
        )
        :calibrates (4334984 4428277)
      ))
    :"jpamb.cases.Arrays.arrayLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 87638363
          :relative 1.2257418065157257
        )
        :calibrates (4045303 6377450)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89872490
          :relative 1.184892650663997
        )
        :calibrates (5820786 5921810)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 101545817
          :relative 1.3653434785023406
        )
        :calibrates (4337619 4419244)
      ))
    :"jpamb.cases.Arrays.arrayNotEmpty:([I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91128157
          :relative 1.1312424172167677
        )
        :calibrates (7455736 6016515)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92147160
          :relative 1.1913119286124836
        )
        :calibrates (5902941 5960209)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101371721
          :relative 1.3627206994080359
        )
        :calibrates (4340064 4454739)
      ))
    :"jpamb.cases.Arrays.arrayOutOfBounds:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91435907
          :relative 1.1913755865672124
        )
        :calibrates (5909036 5860821)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92533991
          :relative 1.2682396100674775
        )
        :calibrates (5892326 4086781)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94545622
          :relative 1.2152651238624501
        )
        :calibrates (4366313 7152462)
      ))
    :"jpamb.cases.Arrays.arraySometimesNull:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94603752
          :relative 1.2068434625510598
        )
        :calibrates (5900816 5850727)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88126558
          :relative 1.3173065158000483
        )
        :calibrates (4072351 4416136)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 105465081
          :relative 1.162670987391201
        )
        :calibrates (7052416 7450913)
      ))
    :"jpamb.cases.Arrays.arraySpellsHello:([C)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88191284
          :relative 1.1750858345274096
        )
        :calibrates (5892761 5893331)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93129473
          :relative 1.173334099559149
        )
        :calibrates (4056995 8439351)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 100171111
          :relative 1.1490617359906412
        )
        :calibrates (7039430 7174388)
      ))
    :"jpamb.cases.Arrays.arraySumIsLarge:([I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93800394
          :relative 1.2025043578028458
        )
        :calibrates (5869327 5899422)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 107892050
          :relative 1.2567299334945101
        )
        :calibrates (5957415 5990428)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 100459363
          :relative 1.1489312553032385
        )
        :calibrates (7051493 7207510)
      ))
    :"jpamb.cases.Arrays.arraySumIsLargeInt:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88922538
          :relative 1.1817834959010753
        )
        :calibrates (5809066 5892887)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91547661
          :relative 1.1926309916956903
        )
        :calibrates (5827820 5922407)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 102341704
          :relative 1.157657016344973
        )
        :calibrates (7008731 7228503)
      ))
    :"jpamb.cases.Arrays.binarySearch:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91466108
          :relative 1.1925793739593764
        )
        :calibrates (5851434 5889721)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 95336036
          :relative 1.207569498107955
        )
        :calibrates (5897997 5924728)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 103885435
          :relative 1.1633443633357543
        )
        :calibrates (7030132 7233834)
      ))
    :"jpamb.cases.Arrays.secretThenDivide:([C)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90391629
          :relative 1.1805572283830195
        )
        :calibrates (5864117 6064799)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 95496737
          :relative 1.2002385143180405
        )
        :calibrates (6001952 6042305)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 105219058
          :relative 1.170565933968181
        )
        :calibrates (7088491 7120344)
      ))
    :"jpamb.cases.BitOperations.bitshiftLeft:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 104561668
          :relative 1.24907025813383
        )
        :calibrates (5876846 5908226)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90756420
          :relative 1.1875685891506245
        )
        :calibrates (5799673 5985576)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 100879111
          :relative 1.1535307556969203
        )
        :calibrates (7034801 7132936)
      ))
    :"jpamb.cases.BitOperations.bitshiftRight:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92719802
          :relative 1.238658987461871
        )
        :calibrates (5909211 4794725)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93700631
          :relative 1.196145464239822
        )
        :calibrates (5976794 5952838)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 111751306
          :relative 1.195363886071002
        )
        :calibrates (7108038 7145370)
      ))
    :"jpamb.cases.BitOperations.bitshiftUnsignedRight:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88030474
          :relative 1.3345220000252713
        )
        :calibrates (4077414 4072275)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92584787
          :relative 1.1908373472912774
        )
        :calibrates (6047990 5884533)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 95122206
          :relative 1.1336221115723997
        )
        :calibrates (7025506 6960374)
      ))
    :"jpamb.cases.BitOperations.bitwiseAnd:(II)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91652284
          :relative 1.3543202397264642
        )
        :calibrates (4032768 4074099)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98944487
          :relative 1.2183652175179813
        )
        :calibrates (5815307 6153652)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 106406402
          :relative 1.1904759081827372
        )
        :calibrates (6767325 6957975)
      ))
    :"jpamb.cases.BitOperations.bitwiseNot:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86055049
          :relative 1.3237516133542016
        )
        :calibrates (4032347 4134506)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92215547
          :relative 1.189794007702654
        )
        :calibrates (5817651 6095870)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94633510
          :relative 1.139753691079475
        )
        :calibrates (6822868 6896094)
      ))
    :"jpamb.cases.BitOperations.bitwiseOr:(II)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93214830
          :relative 1.359124061508688
        )
        :calibrates (4037589 4116791)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 96239950
          :relative 1.204749922940861
        )
        :calibrates (6097963 5914594)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 95865584
          :relative 1.1385256926750211
        )
        :calibrates (6800812 7136115)
      ))
    :"jpamb.cases.BitOperations.drawInt:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 104280684
          :relative 1.4083720520326741
        )
        :calibrates (4045238 4099213)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88181521
          :relative 1.170903832385783
        )
        :calibrates (5983907 5914909)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 99321711
          :relative 1.1469410729700482
        )
        :calibrates (7030245 7132033)
      ))
    :"jpamb.cases.BitOperations.xor:(II)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 85306026
          :relative 1.3212648468355799
        )
        :calibrates (4071358 4070900)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90506202
          :relative 1.1795879910616254
        )
        :calibrates (5867827 6102895)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 102458278
          :relative 1.2510347130552955
        )
        :calibrates (7036030 4459853)
      ))
    :"jpamb.cases.Calls.allPrimesArePositive:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91455568
          :relative 1.2519765386051382
        )
        :calibrates (4058371 6180772)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90609474
          :relative 1.1866916416396571
        )
        :calibrates (5820733 5969217)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93457118
          :relative 1.15919748697211
        )
        :calibrates (4373903 8581320)
      ))
    :"jpamb.cases.Calls.callsAssertFalse:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88829113
          :relative 1.2287969989076601
        )
        :calibrates (6379690 4110620)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94415625
          :relative 1.2058531557412762
        )
        :calibrates (5824783 5930165)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 116595046
          :relative 1.2112529899104003
        )
        :calibrates (7317250 7019711)
      ))
    :"jpamb.cases.Calls.callsAssertFib:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88119907
          :relative 1.2493164104081764
        )
        :calibrates (4027475 5898830)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91767752
          :relative 1.1896935536693973
        )
        :calibrates (5860778 5997634)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 107899565
          :relative 1.1808232735827897
        )
        :calibrates (7063707 7166998)
      ))
    :"jpamb.cases.Calls.callsAssertIf:(Z)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101112203
          :relative 1.230171041683611
        )
        :calibrates (5976609 5926558)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98847585
          :relative 1.2195939055481002
        )
        :calibrates (6055725 5867731)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 105419794
          :relative 1.1717394556209606
        )
        :calibrates (7057366 7140161)
      ))
    :"jpamb.cases.Calls.callsAssertIfWithTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93521164
          :relative 1.2010387007364671
        )
        :calibrates (5833634 5939747)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90262225
          :relative 1.1866976155470947
        )
        :calibrates (5813547 5931058)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101192040
          :relative 1.151953741978129
        )
        :calibrates (7017613 7245772)
      ))
    :"jpamb.cases.Calls.callsAssertTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90470990
          :relative 1.1826522026828137
        )
        :calibrates (5897912 5984022)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 105413880
          :relative 1.256480824454574
        )
        :calibrates (5815002 5865109)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104287269
          :relative 1.1620131363482564
        )
        :calibrates (7052889 7310210)
      ))
    :"jpamb.cases.Calls.callsBowtie:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91861717
          :relative 1.1942542965924012
        )
        :calibrates (5818053 5928495)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92616906
          :relative 1.197065177378118
        )
        :calibrates (5860470 5906241)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99193273
          :relative 1.146086343457468
        )
        :calibrates (7007329 7164499)
      ))
    :"jpamb.cases.Calls.callsCallChain:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93489428
          :relative 1.20124290932611
        )
        :calibrates (5815360 5948493)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96563234
          :relative 1.18800682006913
        )
        :calibrates (5871271 6655380)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 110460311
          :relative 1.1918274893614291
        )
        :calibrates (7112780 7091158)
      ))
    :"jpamb.cases.Calls.callsCallCycle:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91803503
          :relative 1.1846735139119005
        )
        :calibrates (5952047 6048906)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86933999
          :relative 1.1554487551424946
        )
        :calibrates (5807168 6348278)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 107930349
          :relative 1.1709879526500147
        )
        :calibrates (7149438 7411375)
      ))
    :"jpamb.cases.Calls.callsCallCycleFork:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92158626
          :relative 1.1922340189123433
        )
        :calibrates (5890825 5948637)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104227061
          :relative 1.2345671274346588
        )
        :calibrates (5802680 6343602)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97495446
          :relative 1.1402816635594855
        )
        :calibrates (7029715 7086968)
      ))
    :"jpamb.cases.Calls.callsCallCycleLoop:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96916396
          :relative 1.21549994002862
        )
        :calibrates (5907726 5893505)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86079197
          :relative 1.0758161072966301
        )
        :calibrates (8125966 6332163)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99187174
          :relative 1.1437225226397734
        )
        :calibrates (7092085 7156213)
      ))
    :"jpamb.cases.Calls.callsCallCycleNext:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101436493
          :relative 1.2362062148848607
        )
        :calibrates (5827940 5948608)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91035427
          :relative 1.1900446929691557
        )
        :calibrates (5825313 5928959)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99757173
          :relative 1.1472477045572511
        )
        :calibrates (7076508 7137823)
      ))
    :"jpamb.cases.Calls.callsDiamond:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100294658
          :relative 1.2551780826813603
        )
        :calibrates (6583640 4562634)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88791397
          :relative 1.164227299801224
        )
        :calibrates (6226366 5940356)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99331550
          :relative 1.147558163824759
        )
        :calibrates (7052226 7091344)
      ))
    :"jpamb.cases.Calls.callsDumbbell:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101565023
          :relative 1.305306105387223
        )
        :calibrates (4014453 6042538)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101584707
          :relative 1.2318336135592334
        )
        :calibrates (5843319 6069779)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99870265
          :relative 1.1538263686823749
        )
        :calibrates (6871976 7144532)
      ))
    :"jpamb.cases.Calls.callsTadpole:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91408190
          :relative 1.2152088663517628
        )
        :calibrates (4698933 6439042)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99189535
          :relative 1.0366388136712439
        )
        :calibrates (5994925 12238029)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95208134
          :relative 1.1322520085347416
        )
        :calibrates (6923183 7119563)
      ))
    :"jpamb.cases.Calls.callsWheel:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96529945
          :relative 1.1410501083662175
        )
        :calibrates (7668286 6283890)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97096371
          :relative 1.1903775615221248
        )
        :calibrates (6650756 5876485)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 103573169
          :relative 1.1707772648639412
        )
        :calibrates (7041348 6938421)
      ))
    :"jpamb.cases.Calls.divideViaHelper:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88851573
          :relative 1.163630635267909
        )
        :calibrates (6182128 6009578)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88898401
          :relative 1.1762685262269323
        )
        :calibrates (5964522 5883761)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 109374315
          :relative 1.1876526850391882
        )
        :calibrates (7046249 7153892)
      ))
    :"jpamb.cases.Calls.divisionThroughHelper:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95188145
          :relative 1.2076904790624077
        )
        :calibrates (5893025 5908072)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90763348
          :relative 1.1876499436437986
        )
        :calibrates (5851582 5932359)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100454229
          :relative 1.1529725929651422
        )
        :calibrates (7025570 7100639)
      ))
    :"jpamb.cases.Dependent.badNormalizedDistance:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92962534
          :relative 1.198268390180441
        )
        :calibrates (5826174 5951772)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 88705329
          :relative 1.2464068518490092
        )
        :calibrates (6000860 4058558)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 102187633
          :relative 1.1580510919348153
        )
        :calibrates (7089098 7113809)
      ))
    :"jpamb.cases.Dependent.combinedGuidance:(III)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92881240
          :relative 1.1988250799354876
        )
        :calibrates (5801978 5950594)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87281157
          :relative 1.3336830484663147
        )
        :calibrates (4023296 4072647)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100335973
          :relative 1.1504420192958036
        )
        :calibrates (7036388 7155646)
      ))
    :"jpamb.cases.Dependent.compareEquality:(II)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90517644
          :relative 1.2629936332452072
        )
        :calibrates (5790978 4089310)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94509505
          :relative 1.3688583354296817
        )
        :calibrates (4013203 4071185)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102065000
          :relative 1.252329653239549
        )
        :calibrates (7025339 4392323)
      ))
    :"jpamb.cases.Dependent.divisionLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87417788
          :relative 1.3328036595402837
        )
        :calibrates (4012937 4112115)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 114258268
          :relative 1.3599900556085245
        )
        :calibrates (4065792 5909545)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97710447
          :relative 1.3398496578238772
        )
        :calibrates (4394822 4540729)
      ))
    :"jpamb.cases.Dependent.doubleIsAlwaysEven:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88325369
          :relative 1.3401324198266682
        )
        :calibrates (4057056 4014979)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93369050
          :relative 1.193793150620472
        )
        :calibrates (5808774 6143204)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98500017
          :relative 1.3225044750669541
        )
        :calibrates (4956526 4418270)
      ))
    :"jpamb.cases.Dependent.normalizedDistance:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 85649358
          :relative 1.2333977849502518
        )
        :calibrates (4048224 5959984)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86904684
          :relative 1.1528688633826527
        )
        :calibrates (6315928 5907818)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 114592471
          :relative 1.3080245423827568
        )
        :calibrates (4384416 6891752)
      ))
    :"jpamb.cases.Dependent.safeDivByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 84943909
          :relative 1.1561238741495612
        )
        :calibrates (5932535 5926200)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95725701
          :relative 1.2044472183366652
        )
        :calibrates (5817024 6139676)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91289705
          :relative 1.2157690529424798
        )
        :calibrates (6785509 4323690)
      ))
    :"jpamb.cases.Extended.safeDifferenceChain:(III)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101892589
          :relative 1.2398836890271896
        )
        :calibrates (5856485 5873269)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87097094
          :relative 1.145845542521576
        )
        :calibrates (6485332 5965206)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 103895392
          :relative 1.386831139202683
        )
        :calibrates (4254804 4272174)
      ))
    :"jpamb.cases.Extended.safeLoopAccumulation:(III)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99871020
          :relative 1.2224852062075022
        )
        :calibrates (5869994 6096978)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95338561
          :relative 1.2009383773694202
        )
        :calibrates (5814938 6190008)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96048346
          :relative 1.1867149851360406
        )
        :calibrates (4268994 8227981)
      ))
    :"jpamb.cases.Extended.safeNestedLoopDivision:(III)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101341490
          :relative 1.237192615703014
        )
        :calibrates (5857800 5881026)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95147577
          :relative 1.1948189246913326
        )
        :calibrates (6142811 6008099)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96845480
          :relative 1.2207672850246003
        )
        :calibrates (7139937 4510496)
      ))
    :"jpamb.cases.Extended.safeSelectedDivisor:(ZIII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 118620090
          :relative 1.3013744701714458
        )
        :calibrates (5914483 5938121)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95319035
          :relative 1.2069996859449714
        )
        :calibrates (5818958 6017178)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97598934
          :relative 1.3455091193024304
        )
        :calibrates (4352281 4457517)
      ))
    :"jpamb.cases.Extended.unsafeComputedRemainder:(IIIII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 114897725
          :relative 1.2888336385084886
        )
        :calibrates (5796966 6020049)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100348006
          :relative 1.229956209601175
        )
        :calibrates (5930896 5888153)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 120266684
          :relative 1.3216998046092403
        )
        :calibrates (4378690 7088989)
      ))
    :"jpamb.cases.Extended.unsafeLoopOffsetDivisor:(IIII)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 115255904
          :relative 1.2838399834382648
        )
        :calibrates (6059683 5931256)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94205887
          :relative 1.2031562554541648
        )
        :calibrates (5899810 5902086)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96463661
          :relative 1.118481606716624
        )
        :calibrates (7067410 7618881)
      ))
    :"jpamb.cases.Extended.unsafeModeDerivedDivisor:(IIII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102993113
          :relative 1.2443123070709219
        )
        :calibrates (5855193 5880963)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94034501
          :relative 1.2369234347835967
        )
        :calibrates (5949929 4949250)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90003535
          :relative 1.1077169562280078
        )
        :calibrates (7179611 6867034)
      ))
    :"jpamb.cases.Extended.unsafeNestedAffineDivisor:(IIIII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98249985
          :relative 1.2171056892483756
        )
        :calibrates (6019231 5900235)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85476862
          :relative 1.3147676716779977
        )
        :calibrates (4208363 4073173)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102981001
          :relative 1.1666403241465213
        )
        :calibrates (6836982 7195897)
      ))
    :"jpamb.cases.Extended.unsafeNestedLoopDivisor:(IIIII)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99636537
          :relative 1.2283124729968828
        )
        :calibrates (5821231 5958521)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85932026
          :relative 1.315491111745219
        )
        :calibrates (4073605 4238173)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96965826
          :relative 1.1235133106068818
        )
        :calibrates (7528309 7064382)
      ))
    :"jpamb.cases.Loops.decrementLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93940618
          :relative 1.2033160994767331
        )
        :calibrates (5828816 5935517)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 84428419
          :relative 1.227069216574953
        )
        :calibrates (4062880 5947474)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99968295
          :relative 1.2341018156464694
        )
        :calibrates (7153809 4508659)
      ))
    :"jpamb.cases.Loops.doWhileDivision:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93088893
          :relative 1.2700088649044112
        )
        :calibrates (5819354 4178781)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102713856
          :relative 1.2191631349745913
        )
        :calibrates (6474338 5927781)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 105376984
          :relative 1.2716510437492088
        )
        :calibrates (4397324 6877888)
      ))
    :"jpamb.cases.Loops.forLoopDivision:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85372804
          :relative 1.322294787814293
        )
        :calibrates (4019023 4110307)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99535164
          :relative 1.3004217691043345
        )
        :calibrates (5906852 4060614)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99548734
          :relative 1.1628052901149404
        )
        :calibrates (6798162 6887331)
      ))
    :"jpamb.cases.Loops.forever:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89218639
          :relative 1.3416458640642122
        )
        :calibrates (4031208 4094098)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 84161557
          :relative 1.3188980295059163
        )
        :calibrates (4004536 4072383)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99430594
          :relative 1.1589201045425577
        )
        :calibrates (6837796 6954289)
      ))
    :"jpamb.cases.Loops.loopRemainder:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 113988532
          :relative 1.3634333537191163
        )
        :calibrates (4005190 5868007)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89296734
          :relative 1.251021861681842
        )
        :calibrates (4072388 5947058)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101402195
          :relative 1.1727713141598608
        )
        :calibrates (6775739 6848305)
      ))
    :"jpamb.cases.Loops.multiplicationLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92152648
          :relative 1.22249974758529
        )
        :calibrates (5889520 5152234)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94556274
          :relative 1.1921083967359103
        )
        :calibrates (6256667 5894331)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91763802
          :relative 1.1226353497451125
        )
        :calibrates (6852421 6985347)
      ))
    :"jpamb.cases.Loops.nestedLoop:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88297572
          :relative 1.3360080685344857
        )
        :calibrates (4063422 4083071)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92191911
          :relative 1.2651085038420435
        )
        :calibrates (5799487 4214668)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98730226
          :relative 1.1598626408144972
        )
        :calibrates (6803454 6861793)
      ))
    :"jpamb.cases.Loops.neverAsserts:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92088044
          :relative 1.3565177885733963
        )
        :calibrates (4020253 4084046)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 84637235
          :relative 1.3179094402434925
        )
        :calibrates (4038442 4102638)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100968653
          :relative 1.2504403482716002
        )
        :calibrates (6887039 4457222)
      ))
    :"jpamb.cases.Loops.neverDivides:()I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104015429
          :relative 1.4114760037653902
        )
        :calibrates (4040445 4025435)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 84735391
          :relative 1.3152560892947964
        )
        :calibrates (4081064 4119406)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90833873
          :relative 1.322461692467368
        )
        :calibrates (4332905 4313113)
      ))
    :"jpamb.cases.Loops.safeNestedBranchDivision:(III)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 103024474
          :relative 1.2762738484436094
        )
        :calibrates (4009348 6897432)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86994614
          :relative 1.2372420469134031
        )
        :calibrates (4064075 6011743)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 118690187
          :relative 1.3187635252216683
        )
        :calibrates (4217317 7176816)
      ))
    :"jpamb.cases.Loops.terminates:()V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 84713263
          :relative 1.1167122747287248
        )
        :calibrates (7061964 5888017)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89903261
          :relative 1.15835790200106
        )
        :calibrates (6578391 5908305)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 113392934
          :relative 1.1971642940538227
        )
        :calibrates (7262133 7140825)
      ))
    :"jpamb.cases.Loops.whileLoopDivision:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88725723
          :relative 1.1806078458803757
        )
        :calibrates (5812200 5895503)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89467994
          :relative 1.180720006845068
        )
        :calibrates (5879287 5923313)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100106271
          :relative 1.1500887896236698
        )
        :calibrates (7046263 7124802)
      ))
    :"jpamb.cases.MagicConstants.computedIndex:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92399419
          :relative 1.1948176704339464
        )
        :calibrates (5883192 5916796)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90250274
          :relative 1.1866920672909902
        )
        :calibrates (5820904 5922296)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98362493
          :relative 1.1358775370455523
        )
        :calibrates (7195988 7191401)
      ))
    :"jpamb.cases.MagicConstants.derivedNull:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90804729
          :relative 1.1843032318823532
        )
        :calibrates (5881304 5999210)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91733631
          :relative 1.1908267026239991
        )
        :calibrates (5903241 5919873)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98916137
          :relative 1.1420684485357473
        )
        :calibrates (7182228 7081357)
      ))
    :"jpamb.cases.MagicConstants.loopAndEquality:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90902162
          :relative 1.1848919668489288
        )
        :calibrates (5904351 5972799)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93205661
          :relative 1.19748603662486
        )
        :calibrates (5808878 6021163)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101445617
          :relative 1.1580738025088113
        )
        :calibrates (6863632 7235406)
      ))
    :"jpamb.cases.MagicConstants.loopDoubling:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97775344
          :relative 1.1872538469357332
        )
        :calibrates (5889433 6816469)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94244322
          :relative 1.2017818045814992
        )
        :calibrates (5870087 5974049)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101626066
          :relative 1.1554134347193281
        )
        :calibrates (7051754 7159149)
      ))
    :"jpamb.cases.MagicConstants.loopDoublingSafe:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88714259
          :relative 1.238100804196688
        )
        :calibrates (6185920 4068772)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90216141
          :relative 1.185020881492377
        )
        :calibrates (5895622 5888395)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99005287
          :relative 1.145849542150732
        )
        :calibrates (7000375 7152310)
      ))
    :"jpamb.cases.MagicConstants.narrowEquality:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85245557
          :relative 1.3221789344115857
        )
        :calibrates (4024049 4095330)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95402927
          :relative 1.203184323309182
        )
        :calibrates (5940753 6010333)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102561838
          :relative 1.2522883413370889
        )
        :calibrates (7035508 4438825)
      ))
    :"jpamb.cases.MagicConstants.rangeCondition:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92728312
          :relative 1.3590112536528052
        )
        :calibrates (4029806 4084121)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88723979
          :relative 1.1585650773292424
        )
        :calibrates (5901828 6415200)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93525557
          :relative 1.3350351769953708
        )
        :calibrates (4364299 4283889)
      ))
    :"jpamb.cases.MagicConstants.squareThreshold:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85380172
          :relative 1.323179422858798
        )
        :calibrates (4018156 4095332)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89042753
          :relative 1.1639351416938597
        )
        :calibrates (6255560 5953815)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89547410
          :relative 1.3210694196793105
        )
        :calibrates (4220488 4330447)
      ))
    :"jpamb.cases.MagicConstants.squaredDivisor:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87546076
          :relative 1.2434353498204815
        )
        :calibrates (4020480 5975637)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98029088
          :relative 1.2211570192893741
        )
        :calibrates (5846063 5936179)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89982014
          :relative 1.3275805990073994
        )
        :calibrates (4285716 4178858)
      ))
    :"jpamb.cases.MagicConstants.sumReachesTarget:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90006615
          :relative 1.1838203470149875
        )
        :calibrates (5820944 5968249)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96972142
          :relative 1.2125929575355359
        )
        :calibrates (5977017 5910305)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 131601863
          :relative 1.3727522294368473
        )
        :calibrates (4165504 6991300)
      ))
    :"jpamb.cases.MagicConstants.tableLookup:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93434190
          :relative 1.1947363589108508
        )
        :calibrates (5882578 6051791)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94007281
          :relative 1.2000263184408155
        )
        :calibrates (5838295 6023903)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 95123432
          :relative 1.123790755574431
        )
        :calibrates (6930267 7376014)
      ))
    :"jpamb.cases.MagicConstants.tableLookupSafe:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92853504
          :relative 1.199153426434775
        )
        :calibrates (5823779 5916404)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90299222
          :relative 1.188622695313297
        )
        :calibrates (5818235 5879218)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90243431
          :relative 1.1040879517610747
        )
        :calibrates (7226174 6976092)
      ))
    :"jpamb.cases.MagicConstants.twoParams:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98403340
          :relative 1.223285142915542
        )
        :calibrates (5848883 5920527)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95011140
          :relative 1.2000511970929584
        )
        :calibrates (5951044 6037138)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 103951501
          :relative 1.1755720885193093
        )
        :calibrates (6791253 7085526)
      ))
    :"jpamb.cases.MagicConstants.twoParamsSafe:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91611640
          :relative 1.189680746718108
        )
        :calibrates (5888224 5950364)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94071080
          :relative 1.1866779201409217
        )
        :calibrates (5824552 6416203)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 103402131
          :relative 1.1619667312775537
        )
        :calibrates (7047360 7195354)
      ))
    :"jpamb.cases.MagicConstants.unreachableRange:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92200142
          :relative 1.1804156267439532
        )
        :calibrates (5820497 6351055)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97314572
          :relative 1.1808768355896322
        )
        :calibrates (6502457 6330627)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100126743
          :relative 1.1073735491100216
        )
        :calibrates (7567466 8071446)
      ))
    :"jpamb.cases.Operators.branchRemainder:(ZI)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92462515
          :relative 1.1825219826927158
        )
        :calibrates (5804970 6342161)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 115276076
          :relative 1.2858241456899846
        )
        :calibrates (5977775 5960595)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94605157
          :relative 1.099497800591302
        )
        :calibrates (7881567 7165332)
      ))
    :"jpamb.cases.Operators.directRemainder:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 112252506
          :relative 1.2816798151198194
        )
        :calibrates (5802188 5934518)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89567756
          :relative 1.1802682071683273
        )
        :calibrates (5928115 5899944)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 107675916
          :relative 1.178845041945907
        )
        :calibrates (7000382 7265661)
      ))
    :"jpamb.cases.Operators.divisionChain:(IIII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 84407240
          :relative 1.2296315303833492
        )
        :calibrates (5879590 4069381)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93466538
          :relative 1.1719843149097682
        )
        :calibrates (5890040 6690574)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 106813793
          :relative 1.1770993204053783
        )
        :calibrates (6995059 7213761)
      ))
    :"jpamb.cases.Operators.multiplyForDivisor:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85602040
          :relative 1.3230965513214628
        )
        :calibrates (4050250 4085874)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85858590
          :relative 1.1332034774737
        )
        :calibrates (6734009 5902010)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104254343
          :relative 1.1689006092347038
        )
        :calibrates (7000612 7132036)
      ))
    :"jpamb.cases.Operators.negatedDivisor:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86373813
          :relative 1.329267936121509
        )
        :calibrates (4017426 4076219)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 115093769
          :relative 1.2926068559002664
        )
        :calibrates (5800815 5933965)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 94693415
          :relative 1.1199297887527178
        )
        :calibrates (7083010 7285773)
      ))
    :"jpamb.cases.Overflow.arrayIndexAfterOverflow:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 102514067
          :relative 1.3033229392645187
        )
        :calibrates (4019766 6177659)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90528779
          :relative 1.183601847156598
        )
        :calibrates (5903687 5959867)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 113036144
          :relative 1.193543706894141
        )
        :calibrates (7108130 7369705)
      ))
    :"jpamb.cases.Randomness.branchOverlap:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95033619
          :relative 1.20375799154604
        )
        :calibrates (5931881 5957227)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90980405
          :relative 1.189077142460293
        )
        :calibrates (5901003 5872365)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 106879210
          :relative 1.1613598419604054
        )
        :calibrates (7310420 7431817)
      ))
    :"jpamb.cases.Randomness.compareInts:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90841309
          :relative 1.1873293616057146
        )
        :calibrates (5868747 5934025)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93750413
          :relative 1.2021617491591343
        )
        :calibrates (5836932 5934829)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97470484
          :relative 1.1272141163758003
        )
        :calibrates (7292680 7251492)
      ))
    :"jpamb.cases.Randomness.draw34Bits:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91148768
          :relative 1.1897057087998224
        )
        :calibrates (5825675 5952421)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101569471
          :relative 1.2373016726746893
        )
        :calibrates (5837123 5925157)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101713430
          :relative 1.1565748528677902
        )
        :calibrates (7017613 7167521)
      ))
    :"jpamb.cases.Randomness.drawDependsOnArg:(ILjpamb/utils/Smith;)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92011131
          :relative 1.1788191707820377
        )
        :calibrates (5828680 6362653)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89842644
          :relative 1.1828968389966108
        )
        :calibrates (5815255 5977511)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97377712
          :relative 1.1374482237701584
        )
        :calibrates (7012519 7179407)
      ))
    :"jpamb.cases.Randomness.drawInCallee:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91126061
          :relative 1.249470378040246
        )
        :calibrates (6195853 4065443)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89888869
          :relative 1.1792356303936136
        )
        :calibrates (5862922 6035799)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 109582158
          :relative 1.1855937964754362
        )
        :calibrates (7117344 7177389)
      ))
    :"jpamb.cases.Randomness.drawInt:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 87287981
          :relative 1.3341365356518369
        )
        :calibrates (4021348 4066778)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93568966
          :relative 1.1861304745447092
        )
        :calibrates (6215530 5975246)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100888930
          :relative 1.2387702333170403
        )
        :calibrates (7057790 4586239)
      ))
    :"jpamb.cases.Randomness.drawIntOverflow:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97234466
          :relative 1.2901369501661006
        )
        :calibrates (4062066 5908350)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92164358
          :relative 1.1720932868180398
        )
        :calibrates (6456850 5945378)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94893034
          :relative 1.1906072910716796
        )
        :calibrates (4508639 7727856)
      ))
    :"jpamb.cases.Randomness.loopUntilHeads:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95313589
          :relative 1.2107273354130044
        )
        :calibrates (5844993 5889315)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96594774
          :relative 1.206453311701248
        )
        :calibrates (5824198 6185451)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94385374
          :relative 1.3243638680312624
        )
        :calibrates (4459276 4485528)
      ))
    :"jpamb.cases.Randomness.randomBranch:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102806871
          :relative 1.2252545753279676
        )
        :calibrates (5858808 6381647)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92226182
          :relative 1.152670666615631
        )
        :calibrates (5807398 7170775)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93133370
          :relative 1.2114512568097557
        )
        :calibrates (4372233 7074566)
      ))
    :"jpamb.cases.Randomness.randomIndex:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90178842
          :relative 1.1550965972100413
        )
        :calibrates (6346496 6272885)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91035277
          :relative 1.1647348816318877
        )
        :calibrates (6327871 6131750)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 99638599
          :relative 1.148058029403171
        )
        :calibrates (7057379 7113591)
      ))
    :"jpamb.cases.Randomness.randomNull:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 86380550
          :relative 1.337292972801405
        )
        :calibrates (3866601 4079480)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89151833
          :relative 1.3352667937715017
        )
        :calibrates (4115908 4123452)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 97349334
          :relative 1.1357134841801273
        )
        :calibrates (7061410 7183165)
      ))
    :"jpamb.cases.Randomness.spinOnTails:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92461216
          :relative 1.3034287000040397
        )
        :calibrates (5102760 4092434)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96698697
          :relative 1.2865394834776476
        )
        :calibrates (4049147 5948807)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102961695
          :relative 1.1472186696605877
        )
        :calibrates (7026905 7645017)
      ))
    :"jpamb.cases.Randomness.twoDraws:(Ljpamb/utils/Smith;)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93692677
          :relative 1.3794894058823473
        )
        :calibrates (4034315 3786396)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95827442
          :relative 1.1981663935539455
        )
        :calibrates (5838808 6304961)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92246577
          :relative 1.1499843744029938
        )
        :calibrates (4348238 8713347)
      ))
    :"jpamb.cases.Simple.ConstantExtractionCheck:(ILjava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 105799706
          :relative 1.3264249532250194
        )
        :calibrates (3606805 6372252)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 97492052
          :relative 1.2225800875881188
        )
        :calibrates (5821970 5857392)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89011999
          :relative 1.048665166908671
        )
        :calibrates (8728650 7186597)
      ))
    :"jpamb.cases.Simple.assertBoolean:(Z)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98417281
          :relative 1.1359799060619522
        )
        :calibrates (6247503 8144507)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94923580
          :relative 1.2110041729718575
        )
        :calibrates (5817970 5860876)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101368582
          :relative 1.2327899826569657
        )
        :calibrates (7160605 4700998)
      ))
    :"jpamb.cases.Simple.assertFalse:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 106537474
          :relative 1.2441276487041864
        )
        :calibrates (5895378 6249824)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 111912347
          :relative 1.2796031330407596
        )
        :calibrates (5825853 5931373)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 160628576
          :relative 1.3740048464164636
        )
        :calibrates (4575875 9002505)
      ))
    :"jpamb.cases.Simple.assertInteger:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89060544
          :relative 1.160628674154168
        )
        :calibrates (6267514 6037629)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90269665
          :relative 1.1861705612050626
        )
        :calibrates (5884919 5874917)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 197780678
          :relative 1.5450793957837081
        )
        :calibrates (6126070 5149395)
      ))
    :"jpamb.cases.Simple.assertPositive:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99778521
          :relative 1.2258228150441153
        )
        :calibrates (5890568 5973790)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90812914
          :relative 1.191193832178552
        )
        :calibrates (5816176 5878381)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 114200019
          :relative 1.233813994902882
        )
        :calibrates (5056803 8274794)
      ))
    :"jpamb.cases.Simple.assertTrue:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94678272
          :relative 1.2043988917735438
        )
        :calibrates (5813175 6014011)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91737154
          :relative 1.192825953617767
        )
        :calibrates (5869186 5900078)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 106766364
          :relative 1.222715720452567
        )
        :calibrates (8223620 4562793)
      ))
    :"jpamb.cases.Simple.branchDivision:(ZI)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91783778
          :relative 1.1937799038317258
        )
        :calibrates (5827674 5921735)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88819538
          :relative 1.1810932952122202
        )
        :calibrates (5826020 5880969)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 110279304
          :relative 1.2409842843370487
        )
        :calibrates (4468021 8195070)
      ))
    :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90659921
          :relative 1.1857140058087516
        )
        :calibrates (5866547 5956552)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 116342320
          :relative 1.298007999282303
        )
        :calibrates (5819766 5895704)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 109439246
          :relative 1.2325702263918188
        )
        :calibrates (8271211 4541259)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91818838
          :relative 1.1883611452659237
        )
        :calibrates (5814217 6087254)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92290485
          :relative 1.196884172743946
        )
        :calibrates (5810627 5919501)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93761438
          :relative 1.3262019258385036
        )
        :calibrates (4422220 4425927)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91078016
          :relative 1.191626052431074
        )
        :calibrates (5816182 5900847)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93995981
          :relative 1.2015663746701193
        )
        :calibrates (5905652 5913135)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92318374
          :relative 1.2046682775330368
        )
        :calibrates (4416621 7108616)
      ))
    :"jpamb.cases.Simple.directDivision:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92873749
          :relative 1.1962250744841036
        )
        :calibrates (5831480 5990709)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96169679
          :relative 1.2123055285741926
        )
        :calibrates (5902881 5893876)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91635564
          :relative 1.1049294511095298
        )
        :calibrates (7135373 7258067)
      ))
    :"jpamb.cases.Simple.divideByN:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91859257
          :relative 1.1743809459749377
        )
        :calibrates (5933038 6363192)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93984337
          :relative 1.1969976100562
        )
        :calibrates (5837015 6105282)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 105239248
          :relative 1.1852518179938791
        )
        :calibrates (6815532 6923493)
      ))
    :"jpamb.cases.Simple.divideByNMinus10054203:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93045693
          :relative 1.1948592382274867
        )
        :calibrates (5809456 6071928)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91938622
          :relative 1.1965773006535823
        )
        :calibrates (5824737 5868929)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97424777
          :relative 1.1426417759798126
        )
        :calibrates (6789936 7240063)
      ))
    :"jpamb.cases.Simple.divideByZero:()I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92630398
          :relative 1.1902004163491573
        )
        :calibrates (5982613 5973310)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95356148
          :relative 1.2072307623556287
        )
        :calibrates (5816942 6017504)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100790332
          :relative 1.1522707050062537
        )
        :calibrates (7016055 7180343)
      ))
    :"jpamb.cases.Simple.divideZeroByZero:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97338136
          :relative 1.220049294720291
        )
        :calibrates (5862098 5866976)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95622522
          :relative 1.208279314172428
        )
        :calibrates (5797090 6041797)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 103432107
          :relative 1.1657054585091087
        )
        :calibrates (7014232 7110490)
      ))
    :"jpamb.cases.Simple.doNothing:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89419275
          :relative 1.1738484679292025
        )
        :calibrates (5946370 6037930)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 105891723
          :relative 1.2559015308561963
        )
        :calibrates (5839988 5908730)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99095354
          :relative 1.1400871717388992
        )
        :calibrates (7124412 7230354)
      ))
    :"jpamb.cases.Simple.earlyReturn:()I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91376881
          :relative 1.181996400638612
        )
        :calibrates (5843628 6175416)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89463545
          :relative 1.1828424170654572
        )
        :calibrates (5857461 5887016)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 99054355
          :relative 1.1507362014765745
        )
        :calibrates (6974146 7027122)
      ))
    :"jpamb.cases.Simple.guardedDivision:(I)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104466315
          :relative 1.2686739686577468
        )
        :calibrates (5827068 5427590)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 102256977
          :relative 1.2271526066043847
        )
        :calibrates (5869624 6252266)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95990590
          :relative 1.2316363081394752
        )
        :calibrates (6840948 4421229)
      ))
    :"jpamb.cases.Simple.integerRangeBoundary:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 146471296
          :relative 1.407758651333312
        )
        :calibrates (4630603 6825156)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 117583031
          :relative 1.2826336969796646
        )
        :calibrates (6389072 5878001)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90999608
          :relative 1.3209178731595232
        )
        :calibrates (4276739 4415900)
      ))
    :"jpamb.cases.Simple.justAdd:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98678857
          :relative 1.270600417790447
        )
        :calibrates (6443057 4141037)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 114418235
          :relative 1.2855509326994485
        )
        :calibrates (5834631 6022355)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92055233
          :relative 1.2038878978706788
        )
        :calibrates (4327588 7185467)
      ))
    :"jpamb.cases.Simple.justMulitply:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 118354310
          :relative 1.3562660466777214
        )
        :calibrates (4076076 6345851)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 116969559
          :relative 1.2977922402499524
        )
        :calibrates (5848625 5935860)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 88881057
          :relative 1.1468453957503941
        )
        :calibrates (5806533 6869805)
      ))
    :"jpamb.cases.Simple.justReturn:()I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 97349601
          :relative 1.173337602076822
        )
        :calibrates (6357788 6704720)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 101726774
          :relative 1.2357904403063076
        )
        :calibrates (5910792 5910769)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96316656
          :relative 1.2351379441203276
        )
        :calibrates (6794422 4415264)
      ))
    :"jpamb.cases.Simple.justReturnNothing:()V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 98130258
          :relative 1.2159482206769705
        )
        :calibrates (6052519 5884193)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95048893
          :relative 1.2035900859488273
        )
        :calibrates (5803892 6091725)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 100696247
          :relative 1.2574856099971798
        )
        :calibrates (4231134 6900468)
      ))
    :"jpamb.cases.Simple.multiError:(Z)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94056562
          :relative 1.2040793239489846
        )
        :calibrates (5876284 5881887)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96344270
          :relative 1.2115022029819942
        )
        :calibrates (5896407 5943647)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" no
            :ok no
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 104259925
          :relative 1.2624892561142755
        )
        :calibrates (6903743 4489783)
      ))
    :"jpamb.cases.Simple.nestedBranchDivision:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 96434594
          :relative 1.1958431151548181
        )
        :calibrates (5875605 6410656)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89692969
          :relative 1.1816960275049035
        )
        :calibrates (5892962 5912755)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92866724
          :relative 1.3262764140791214
        )
        :calibrates (4356140 4406071)
      ))
    :"jpamb.cases.Simple.nestedConstantCoverage:(III)V" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94212259
          :relative 1.2049930002263036
        )
        :calibrates (5809917 5942966)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92401875
          :relative 1.1970936246340007
        )
        :calibrates (5825266 5913357)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 135766700
          :relative 1.3637894568048203
        )
        :calibrates (4376683 7373207)
      ))
    :"jpamb.cases.Simple.selectedDivisor:(ZII)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91876828
          :relative 1.1760188628455255
        )
        :calibrates (5800753 6451533)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 89970864
          :relative 1.1870616295259155
        )
        :calibrates (5814931 5881955)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92633410
          :relative 1.1062580276870744
        )
        :calibrates (7100187 7405544)
      ))
    :"jpamb.cases.Simple.subtractForDivisor:(II)I" ((analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 94469056
          :relative 1.2031618775180224
        )
        :calibrates (5868725 5965987)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 93635798
          :relative 1.198825363340558
        )
        :calibrates (5907118 5940923)
      ) (analysis-result
        :response (response
          :predictions (
            :* no
            :"assertion error" no
            :"divide by zero" dzyes
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 95019554
          :relative 1.1205902548823643
        )
        :calibrates (7044763 7351598)
      ))
    :"jpamb.cases.Strings.checkComplexSequence:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90550642
          :relative 1.1836888539806347
        )
        :calibrates (5920770 5943272)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93806855
          :relative 1.2036501174074499
        )
        :calibrates (5811009 5927541)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 134299280
          :relative 1.275976062537336
        )
        :calibrates (7193673 7033795)
      ))
    :"jpamb.cases.Strings.checkExtension:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91468414
          :relative 1.1856216415090635
        )
        :calibrates (5954235 5976838)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91518724
          :relative 1.1889915778284437
        )
        :calibrates (5825496 6019867)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 100217781
          :relative 1.1544055724575817
        )
        :calibrates (6862288 7184247)
      ))
    :"jpamb.cases.Strings.sayHello2:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90694789
          :relative 1.1856596726436486
        )
        :calibrates (5826139 6002987)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91788409
          :relative 1.171156237335417
        )
        :calibrates (6360433 6017884)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 102080076
          :relative 1.1511598586402156
        )
        :calibrates (7009689 7405194)
      ))
    :"jpamb.cases.Strings.sayHello3:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 89505448
          :relative 1.1755114520234695
        )
        :calibrates (6046616 5903387)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90629599
          :relative 1.175681937287448
        )
        :calibrates (6124194 5971147)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 102867578
          :relative 1.1521058708872358
        )
        :calibrates (7332692 7161788)
      ))
    :"jpamb.cases.Strings.sayHello:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 93929981
          :relative 1.1977922727717172
        )
        :calibrates (5816652 6096919)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92418925
          :relative 1.1842335485344953
        )
        :calibrates (5812943 6280706)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 101084021
          :relative 1.1553777041684492
        )
        :calibrates (7051002 7085267)
      ))
    :"jpamb.cases.Tricky.collatz:(I)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91742637
          :relative 1.1943312679362332
        )
        :calibrates (5823399 5905843)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90214793
          :relative 1.1806183003278115
        )
        :calibrates (5885439 6018466)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 113697886
          :relative 1.1978971848661273
        )
        :calibrates (7163182 7254160)
      ))
    :"jpamb.cases.advanced.CWE470.strict_safe_dispatcher:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 92691025
          :relative 1.1964685350468058
        )
        :calibrates (5796710 5995607)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91262430
          :relative 1.1846517304364572
        )
        :calibrates (6007172 5923648)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 99345647
          :relative 1.1437238842542585
        )
        :calibrates (6998627 7272391)
      ))
    :"jpamb.cases.advanced.CWE470.unsafe_dispatcher:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 96341343
          :relative 1.2113185529444337
        )
        :calibrates (5855856 5988846)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91111635
          :relative 1.1848296044391429
        )
        :calibrates (5906078 6000151)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 96035244
          :relative 1.126802050362362
        )
        :calibrates (7023649 7319965)
      ))
    :"jpamb.cases.advanced.CWE470.weak_dispatcher:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 87345900
          :relative 1.3324975265278176
        )
        :calibrates (4026001 4098094)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90157530
          :relative 1.1787237014465366
        )
        :calibrates (5823006 6125354)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98781469
          :relative 1.141432116904451
        )
        :calibrates (6979047 7286005)
      ))
    :"jpamb.cases.advanced.CWE502.blacklist_deserialization:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 83918470
          :relative 1.1160583122480179
        )
        :calibrates (4046601 8801213)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 90442204
          :relative 1.1850064087605545
        )
        :calibrates (5807305 6006634)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98593823
          :relative 1.1412706662959238
        )
        :calibrates (7018888 7224360)
      ))
    :"jpamb.cases.advanced.CWE502.insecure_deserialization:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 102962298
          :relative 1.3163301397071256
        )
        :calibrates (3998355 5941455)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98969685
          :relative 1.226773427067488
        )
        :calibrates (5814210 5928241)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 99168955
          :relative 1.1419773793191088
        )
        :calibrates (7034285 7268755)
      ))
    :"jpamb.cases.advanced.CWE502.whitelist_deserialization:(Ljava/lang/String;)V" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 97252241
          :relative 1.2178526429646133
        )
        :calibrates (5849454 5928693)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 91633684
          :relative 1.1924698083367515
        )
        :calibrates (5876394 5889240)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" aeyes
            :"divide by zero" dzyes
            :"null pointer" npyes
            :ok okyes
            :"out of bounds" obyes
          )
        )
        :duration (duration
          :absolute 98586580
          :relative 1.1435943971438294
        )
        :calibrates (7061268 7104933)
      ))
  )
)