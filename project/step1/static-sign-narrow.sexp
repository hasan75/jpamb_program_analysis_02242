(analysis-summary
  :config (analysis-config
    :cmd (solutions/static/.venv/bin/static-sign-narrow)
    :analysis (analysis-info
      :name static-sign-narrow
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
          :absolute 87862455
          :relative 1.254255145885553
        )
        :calibrates (3963922 5821469)
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
          :absolute 104713252
          :relative 1.4101180004399103
        )
        :calibrates (4236135 3909288)
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
          :absolute 87478136
          :relative 1.311965720191873
        )
        :calibrates (4233331 4296959)
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
          :absolute 87997049
          :relative 1.2373400730498765
        )
        :calibrates (4039209 6150412)
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
          :absolute 91353887
          :relative 1.3504613180506662
        )
        :calibrates (3865447 4287145)
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
          :absolute 88286017
          :relative 1.30764389244299
        )
        :calibrates (4287437 4407732)
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
          :absolute 90493645
          :relative 1.249789350713609
        )
        :calibrates (5876285 4306316)
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
          :absolute 88902585
          :relative 1.319705570100355
        )
        :calibrates (4222535 4293527)
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
          :absolute 92054147
          :relative 1.3346748965464936
        )
        :calibrates (4246104 4273089)
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
          :absolute 86716424
          :relative 1.322534613696439
        )
        :calibrates (4093774 4158939)
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
          :absolute 86241849
          :relative 1.2991235580298746
        )
        :calibrates (4276938 4385188)
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
          :absolute 85612238
          :relative 1.3002167645559146
        )
        :calibrates (4238872 4338398)
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
          :absolute 92581965
          :relative 1.3568246517408666
        )
        :calibrates (3833673 4308339)
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
          :absolute 85996307
          :relative 1.304066369225181
        )
        :calibrates (4237599 4302117)
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
          :absolute 90072242
          :relative 1.3235692225135929
        )
        :calibrates (4237734 4313952)
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
          :absolute 90810898
          :relative 1.2177515926589217
        )
        :calibrates (4475662 6524938)
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
          :absolute 87747798
          :relative 1.3064932949568946
        )
        :calibrates (4366710 4298377)
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
          :absolute 90174051
          :relative 1.3145328181558944
        )
        :calibrates (4241716 4499639)
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
          :absolute 90129988
          :relative 1.1671466054615762
        )
        :calibrates (5897948 6369457)
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
          :absolute 87062377
          :relative 1.2980887764064657
        )
        :calibrates (4348943 4416457)
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
          :absolute 85980838
          :relative 1.3027767664708745
        )
        :calibrates (4279788 4283783)
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
          :absolute 104836823
          :relative 1.2261638878315986
        )
        :calibrates (5856787 6599252)
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
          :absolute 86428205
          :relative 1.3024626734245515
        )
        :calibrates (4283503 4330853)
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
          :absolute 86857852
          :relative 1.3181884424849988
        )
        :calibrates (4297508 4051803)
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
          :absolute 92201895
          :relative 1.1158569062512183
        )
        :calibrates (7991892 6130652)
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
          :absolute 89265034
          :relative 1.2035013819183642
        )
        :calibrates (4247740 6926294)
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
          :absolute 91893924
          :relative 1.368730394820884
        )
        :calibrates (3966101 3896865)
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
          :absolute 89440209
          :relative 1.1416376689083385
        )
        :calibrates (6639043 6270924)
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
          :absolute 88284970
          :relative 1.2393105228260746
        )
        :calibrates (5824303 4352380)
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
          :absolute 89484034
          :relative 1.3115509257269613
        )
        :calibrates (4446777 4287453)
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
          :absolute 85475789
          :relative 1.139067493131931
        )
        :calibrates (6109636 6301331)
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
          :absolute 88957633
          :relative 1.296115300710147
        )
        :calibrates (4232064 4764940)
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
          :absolute 91205111
          :relative 1.3534194288131827
        )
        :calibrates (4222840 3861224)
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
          :absolute 93029318
          :relative 1.2028338599691821
        )
        :calibrates (6744702 4918451)
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
          :absolute 90046501
          :relative 1.3084616140297725
        )
        :calibrates (4260028 4591846)
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
          :absolute 96718657
          :relative 1.3883146328711935
        )
        :calibrates (4003249 3907646)
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
          :absolute 87960758
          :relative 1.2806952586917202
        )
        :calibrates (4290907 4926817)
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
          :absolute 90133675
          :relative 1.3154509447306033
        )
        :calibrates (4390804 4328185)
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
          :absolute 91918870
          :relative 1.3002461101002647
        )
        :calibrates (4637202 4571291)
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
          :absolute 90018061
          :relative 1.3024932811229735
        )
        :calibrates (4639609 4331918)
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
          :absolute 91179878
          :relative 1.3246110884789752
        )
        :calibrates (3885775 4750330)
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
          :absolute 96119237
          :relative 1.3604741052883882
        )
        :calibrates (4308234 4074124)
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
          :absolute 90807541
          :relative 1.225794591696154
        )
        :calibrates (4570818 6227530)
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
          :absolute 89104543
          :relative 1.2052099203301185
        )
        :calibrates (4267715 6842435)
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
          :absolute 86898294
          :relative 1.2957758742120133
        )
        :calibrates (4227155 4568443)
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
          :absolute 93974721
          :relative 1.2670403538748984
        )
        :calibrates (5896966 4265537)
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
          :absolute 92544410
          :relative 1.1777915899576097
        )
        :calibrates (5448788 6842251)
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
          :absolute 89774757
          :relative 1.3216025685934056
        )
        :calibrates (4233213 4328914)
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
          :absolute 85000998
          :relative 1.2907427722721738
        )
        :calibrates (4246960 4456887)
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
          :absolute 98070040
          :relative 1.2495138855848609
        )
        :calibrates (6547491 4494629)
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
          :absolute 86567779
          :relative 1.328518538742643
        )
        :calibrates (4262491 3863339)
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
          :absolute 86781034
          :relative 1.2933356215273106
        )
        :calibrates (4572551 4260672)
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
          :absolute 89948614
          :relative 1.3234070497260453
        )
        :calibrates (4237254 4305884)
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
          :absolute 92486927
          :relative 1.3461338842732125
        )
        :calibrates (3998345 4338015)
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
          :absolute 86530573
          :relative 1.2886042788071017
        )
        :calibrates (4605597 4298611)
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
          :absolute 88544512
          :relative 1.3152702696498393
        )
        :calibrates (4265687 4303140)
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
          :absolute 84435897
          :relative 1.3056216828178993
        )
        :calibrates (3913887 4440901)
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
          :absolute 91287515
          :relative 1.3269209122693206
        )
        :calibrates (4295686 4304750)
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
          :absolute 104103714
          :relative 1.3838527076523972
        )
        :calibrates (4300840 4302033)
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
          :absolute 83780249
          :relative 1.2621579865855537
        )
        :calibrates (4250308 4912185)
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
          :absolute 88543924
          :relative 1.3085139882757832
        )
        :calibrates (4245671 4457445)
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
          :absolute 90234641
          :relative 1.3434157008991696
        )
        :calibrates (4296315 3888099)
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
          :absolute 84364519
          :relative 1.2726491113265443
        )
        :calibrates (4705467 4300715)
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
          :absolute 84235075
          :relative 1.2059820318602252
        )
        :calibrates (4310614 6173722)
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
          :absolute 90552482
          :relative 1.3410495856165008
        )
        :calibrates (3894725 4363387)
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
          :absolute 85223406
          :relative 1.2980731489797646
        )
        :calibrates (4285994 4294568)
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
          :absolute 89418797
          :relative 1.1491320230941764
        )
        :calibrates (6203746 6482315)
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
          :absolute 88009068
          :relative 1.313228577203201
        )
        :calibrates (4237394 4319750)
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
          :absolute 87096404
          :relative 1.2961513362932646
        )
        :calibrates (4299472 4508560)
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
          :absolute 90439677
          :relative 1.2324876659160973
        )
        :calibrates (6121174 4468957)
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
          :absolute 87363519
          :relative 1.3035634900447417
        )
        :calibrates (4238082 4447454)
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
          :absolute 88187353
          :relative 1.3130669181510237
        )
        :calibrates (4270143 4307528)
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
          :absolute 88894211
          :relative 1.3186024162543943
        )
        :calibrates (4233760 4303157)
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
          :absolute 88889503
          :relative 1.3178932288387835
        )
        :calibrates (4260109 4290307)
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
          :absolute 96249777
          :relative 1.2448620659012204
        )
        :calibrates (4538084 6415788)
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
          :absolute 91293549
          :relative 1.3234385660690884
        )
        :calibrates (4274388 4395860)
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
          :absolute 90880456
          :relative 1.322747954362922
        )
        :calibrates (4295036 4349716)
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
          :absolute 92163494
          :relative 1.1577603583818958
        )
        :calibrates (6147722 6670523)
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
          :absolute 86616785
          :relative 1.3038606904176768
        )
        :calibrates (4265794 4339612)
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
          :absolute 85966134
          :relative 1.3018361415220878
        )
        :calibrates (4286527 4294144)
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
          :absolute 92208784
          :relative 1.2534991968328484
        )
        :calibrates (5977519 4309821)
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
          :absolute 93284387
          :relative 1.3343251649173455
        )
        :calibrates (4284358 4355643)
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
          :absolute 94464461
          :relative 1.3450616951621925
        )
        :calibrates (4235360 4300293)
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
          :absolute 87278929
          :relative 1.3012734817849612
        )
        :calibrates (4362315 4360686)
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
          :absolute 88358603
          :relative 1.2993248121963894
        )
        :calibrates (4329348 4541273)
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
          :absolute 88013779
          :relative 1.3131205982032355
        )
        :calibrates (4268114 4291616)
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
          :absolute 88260940
          :relative 1.3109697574555899
        )
        :calibrates (4318434 4307950)
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
          :absolute 86279142
          :relative 1.3030809480076102
        )
        :calibrates (4227398 4359867)
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
          :absolute 91719768
          :relative 1.330260587119128
        )
        :calibrates (4280844 4294121)
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
          :absolute 85759737
          :relative 1.2936971546513858
        )
        :calibrates (4293664 4428340)
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
          :absolute 86254145
          :relative 1.3057527098577928
        )
        :calibrates (4253711 4278415)
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
          :absolute 91248941
          :relative 1.3299379979902932
        )
        :calibrates (4234504 4302782)
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
          :absolute 90315885
          :relative 1.3179553632015015
        )
        :calibrates (4285543 4400836)
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
          :absolute 87426532
          :relative 1.2938779476127824
        )
        :calibrates (4224971 4662850)
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
          :absolute 96298959
          :relative 1.3490807949329355
        )
        :calibrates (4315555 4305706)
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
          :absolute 85437279
          :relative 1.3148289007168101
        )
        :calibrates (4308906 3967628)
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
          :absolute 85407484
          :relative 1.302826585625768
        )
        :calibrates (4225708 4279782)
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
          :absolute 91283565
          :relative 1.3296944611278778
        )
        :calibrates (4249632 4295684)
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
          :absolute 87121461
          :relative 1.300971331971934
        )
        :calibrates (4417994 4295329)
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
          :absolute 95281183
          :relative 1.3431663535419678
        )
        :calibrates (4277361 4369745)
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
          :absolute 90328113
          :relative 1.3089749976387905
        )
        :calibrates (4565961 4303106)
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
          :absolute 95545997
          :relative 1.2642391369713692
        )
        :calibrates (4372276 6027006)
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
          :absolute 138168727
          :relative 1.2850614749032983
        )
        :calibrates (4276934 10057425)
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
          :absolute 88689164
          :relative 1.3157480274450173
        )
        :calibrates (4267544 4305845)
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
          :absolute 89277002
          :relative 1.240390078469514
        )
        :calibrates (5976523 4288963)
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
          :absolute 145350357
          :relative 1.2085308268107995
        )
        :calibrates (8795010 9190190)
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
          :absolute 85314474
          :relative 1.2951815788254861
        )
        :calibrates (4318318 4328795)
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
          :absolute 86734785
          :relative 1.3031705885241132
        )
        :calibrates (4320860 4309973)
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
          :absolute 139327618
          :relative 1.2708616611596173
        )
        :calibrates (8469326 6465685)
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
          :absolute 87011909
          :relative 1.2785295360831306
        )
        :calibrates (4285274 4878601)
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
          :absolute 93418700
          :relative 1.3403213037704338
        )
        :calibrates (4258978 4274823)
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
          :absolute 93101539
          :relative 1.2989305760857839
        )
        :calibrates (5000349 4354920)
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
          :absolute 98698530
          :relative 1.2882171902601356
        )
        :calibrates (4234260 5931117)
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
          :absolute 92994774
          :relative 1.3299681881510572
        )
        :calibrates (4358113 4341909)
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
          :absolute 98272689
          :relative 1.3503626280250285
        )
        :calibrates (4424670 4347362)
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
          :absolute 89926852
          :relative 1.1511124167280071
        )
        :calibrates (6613468 6086627)
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
          :absolute 91612673
          :relative 1.3104021226070062
        )
        :calibrates (4672932 4292752)
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
          :absolute 98639933
          :relative 1.3715319974690794
        )
        :calibrates (4042299 4343622)
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
          :absolute 98284293
          :relative 1.2072668225069658
        )
        :calibrates (6141815 6055024)
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
          :absolute 93926356
          :relative 1.3330182869244995
        )
        :calibrates (4325894 4399784)
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
          :absolute 91833544
          :relative 1.3521962281297388
        )
        :calibrates (4249190 3913534)
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
          :absolute 89805245
          :relative 1.222757707876777
        )
        :calibrates (6390215 4363883)
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
          :absolute 89468139
          :relative 1.2975373641231893
        )
        :calibrates (4281844 4737211)
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
          :absolute 89417847
          :relative 1.351056535884805
        )
        :calibrates (3882023 4086864)
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
          :absolute 88159582
          :relative 1.2146400838791767
        )
        :calibrates (4537156 6219058)
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
          :absolute 87009376
          :relative 1.3085377016614705
        )
        :calibrates (4271853 4279963)
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
          :absolute 87473850
          :relative 1.3493887049210114
        )
        :calibrates (3865623 3960011)
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
          :absolute 116957398
          :relative 1.2696679682589371
        )
        :calibrates (6343096 6228480)
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
          :absolute 91909494
          :relative 1.3310171381934932
        )
        :calibrates (4240170 4337577)
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
          :absolute 90363458
          :relative 1.2352598217754542
        )
        :calibrates (3861898 6651982)
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
          :absolute 94065840
          :relative 1.263249052759814
        )
        :calibrates (5935835 4325713)
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
          :absolute 88229253
          :relative 1.298764074589117
        )
        :calibrates (4582756 4286323)
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
          :absolute 87186335
          :relative 1.2494106267454426
        )
        :calibrates (5413069 4405943)
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
          :absolute 87682994
          :relative 1.3125845362394783
        )
        :calibrates (4247881 4290211)
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
          :absolute 86058234
          :relative 1.3028242725342845
        )
        :calibrates (4249840 4320502)
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
          :absolute 87700338
          :relative 1.3103001703610277
        )
        :calibrates (4302039 4282779)
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
          :absolute 88928500
          :relative 1.2093916191576444
        )
        :calibrates (4310385 6671562)
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
          :absolute 97635824
          :relative 1.3599257513504308
        )
        :calibrates (4232454 4292920)
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
          :absolute 90790473
          :relative 1.3237225478449746
        )
        :calibrates (4238331 4378503)
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
          :absolute 91160470
          :relative 1.1226249539706006
        )
        :calibrates (7106514 6640602)
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
          :absolute 91012460
          :relative 1.3294702890771588
        )
        :calibrates (4220924 4303412)
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
          :absolute 97990410
          :relative 1.3618297952963123
        )
        :calibrates (4297584 4221321)
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
          :absolute 89758625
          :relative 1.152973744352301
        )
        :calibrates (6297463 6324661)
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
          :absolute 85121418
          :relative 1.2952954919887878
        )
        :calibrates (4328859 4296424)
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
          :absolute 95683238
          :relative 1.243863287541017
        )
        :calibrates (3820208 7094260)
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
          :absolute 87437178
          :relative 1.2295942734638245
        )
        :calibrates (5991854 4315136)
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
          :absolute 127130312
          :relative 1.4732358942876318
        )
        :calibrates (4259588 4291930)
      ))
    :"jpamb.cases.Dependent.safeDivByN:(I)I" ((analysis-result
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
          :absolute 82156381
          :relative 1.2770784273249693
        )
        :calibrates (4148468 4532994)
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
          :absolute 95045684
          :relative 1.299740547842553
        )
        :calibrates (4363083 5169747)
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
          :absolute 86572549
          :relative 1.301081764404958
        )
        :calibrates (4243185 4413038)
      ))
    :"jpamb.cases.Extended.safeDifferenceChain:(III)I" ((analysis-result
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
          :absolute 84830054
          :relative 1.3028292782807274
        )
        :calibrates (4155511 4292422)
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
          :absolute 87432255
          :relative 1.3119614407428963
        )
        :calibrates (4242493 4283407)
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
          :absolute 93451953
          :relative 1.342430762463165
        )
        :calibrates (4217438 4278036)
      ))
    :"jpamb.cases.Extended.safeLoopAccumulation:(III)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 91591898
          :relative 1.3321625091319051
        )
        :calibrates (4234695 4290897)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 86763628
          :relative 1.3061527154209218
        )
        :calibrates (4265455 4309167)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85696755
          :relative 1.3114352965774074
        )
        :calibrates (4239182 4127612)
      ))
    :"jpamb.cases.Extended.safeNestedLoopDivision:(III)I" ((analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 92635301
          :relative 1.29327423403302
        )
        :calibrates (4831466 4598981)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 85011601
          :relative 1.2770694835681402
        )
        :calibrates (4683383 4299975)
      ) (analysis-result
        :response (response
          :predictions (
            :* lpyes
            :"assertion error" no
            :"divide by zero" no
            :"null pointer" no
            :ok okyes
            :"out of bounds" no
          )
        )
        :duration (duration
          :absolute 90790693
          :relative 1.3423419385850557
        )
        :calibrates (4127981 4127253)
      ))
    :"jpamb.cases.Extended.safeSelectedDivisor:(ZIII)I" ((analysis-result
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
          :absolute 91605698
          :relative 1.340271132110155
        )
        :calibrates (3986947 4382203)
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
          :absolute 89051075
          :relative 1.3065827670748187
        )
        :calibrates (4229905 4562069)
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
          :absolute 88243786
          :relative 1.3275912484548904
        )
        :calibrates (4004111 4296745)
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
          :absolute 94386588
          :relative 1.3416365500658503
        )
        :calibrates (4295428 4300717)
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
          :absolute 89526933
          :relative 1.316862459984325
        )
        :calibrates (4251034 4381161)
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
          :absolute 89712280
          :relative 1.320967813568271
        )
        :calibrates (4226938 4341745)
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
          :absolute 87782027
          :relative 1.3087801861319504
        )
        :calibrates (4276551 4346390)
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
          :absolute 86802186
          :relative 1.305863866130936
        )
        :calibrates (4277073 4307067)
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
          :absolute 88665622
          :relative 1.3126549623858186
        )
        :calibrates (4313905 4318470)
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
          :absolute 90188069
          :relative 1.2176787371907276
        )
        :calibrates (4306909 6620076)
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
          :absolute 92312443
          :relative 1.3330222808399492
        )
        :calibrates (4284005 4291663)
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
          :absolute 90668527
          :relative 1.3189432430425285
        )
        :calibrates (4369873 4330609)
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
          :absolute 104884997
          :relative 1.1898921242904335
        )
        :calibrates (6314121 7233132)
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
          :absolute 90907691
          :relative 1.3202721887027917
        )
        :calibrates (4361917 4334862)
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
          :absolute 86979257
          :relative 1.305815505061399
        )
        :calibrates (4311413 4291196)
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
          :absolute 94185946
          :relative 1.2671899170025802
        )
        :calibrates (5854635 4327203)
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
          :absolute 88014722
          :relative 1.3135762323316982
        )
        :calibrates (4263726 4287120)
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
          :absolute 93036216
          :relative 1.3364719630538509
        )
        :calibrates (4246540 4327985)
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
          :absolute 87844688
          :relative 1.3121028198504812
        )
        :calibrates (4239898 4323432)
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
          :absolute 88507554
          :relative 1.3082256941323924
        )
        :calibrates (4409254 4296064)
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
          :absolute 90053964
          :relative 1.3173825623775055
        )
        :calibrates (4336328 4336291)
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
          :absolute 85642267
          :relative 1.3007162984526515
        )
        :calibrates (4236534 4333881)
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
          :absolute 88978932
          :relative 1.332707551120358
        )
        :calibrates (4344916 3927067)
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
          :absolute 88864540
          :relative 1.3130569485200032
        )
        :calibrates (4321996 4321741)
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
          :absolute 92388633
          :relative 1.3111352608567708
        )
        :calibrates (4302555 4723818)
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
          :absolute 91696533
          :relative 1.3333409900283117
        )
        :calibrates (4222035 4290167)
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
          :absolute 85763395
          :relative 1.2969145291897246
        )
        :calibrates (4303306 4354691)
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
          :absolute 85812465
          :relative 1.3033499817674075
        )
        :calibrates (4241794 4293734)
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
          :absolute 88772533
          :relative 1.3149093485293932
        )
        :calibrates (4296853 4301183)
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
          :absolute 85329927
          :relative 1.2740217983082152
        )
        :calibrates (4240092 4840404)
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
          :absolute 91690261
          :relative 1.3298347883992803
        )
        :calibrates (4246797 4333818)
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
          :absolute 86449318
          :relative 1.2981173938636257
        )
        :calibrates (4236984 4466120)
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
          :absolute 86520008
          :relative 1.2485197099058474
        )
        :calibrates (5520688 4243291)
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
          :absolute 88922397
          :relative 1.2910300229019032
        )
        :calibrates (4825578 4273788)
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
          :absolute 94158856
          :relative 1.3091784023278839
        )
        :calibrates (4582501 4658367)
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
          :absolute 87099883
          :relative 1.3252819811601007
        )
        :calibrates (4225417 4011517)
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
          :absolute 86111646
          :relative 1.2942942317562809
        )
        :calibrates (4454387 4291375)
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
          :absolute 90899201
          :relative 1.3268142729096468
        )
        :calibrates (4297194 4268761)
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
          :absolute 85161139
          :relative 1.2272075542561889
        )
        :calibrates (3777163 6316851)
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
          :absolute 88083668
          :relative 1.3166771981139924
        )
        :calibrates (4213299 4283360)
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
          :absolute 102783339
          :relative 1.3813665100386157
        )
        :calibrates (4250583 4291941)
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
          :absolute 85786459
          :relative 1.3027724014906557
        )
        :calibrates (4238607 4305690)
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
          :absolute 87591566
          :relative 1.3122278064402872
        )
        :calibrates (4250133 4286065)
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
          :absolute 88001120
          :relative 1.2241856025564584
        )
        :calibrates (4304721 6198744)
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
          :absolute 87649740
          :relative 1.3107425456438595
        )
        :calibrates (4297381 4273749)
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
          :absolute 86524920
          :relative 1.3084514911198513
        )
        :calibrates (4227162 4278727)
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
          :absolute 86692398
          :relative 1.2223348177365592
        )
        :calibrates (6044021 4347430)
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
          :absolute 91079564
          :relative 1.3339708671655008
        )
        :calibrates (4245605 4197070)
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
          :absolute 86077706
          :relative 1.3057596939983065
        )
        :calibrates (4221190 4293346)
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
          :absolute 87210681
          :relative 1.296366665845027
        )
        :calibrates (4489253 4325964)
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
          :absolute 86382994
          :relative 1.3092885644195265
        )
        :calibrates (3830340 4645245)
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
          :absolute 84549098
          :relative 1.3136928366476435
        )
        :calibrates (4226199 3985748)
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
          :absolute 93187127
          :relative 1.334231371067072
        )
        :calibrates (4289824 4343033)
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
          :absolute 85502928
          :relative 1.3002588718312693
        )
        :calibrates (4262888 4302600)
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
          :absolute 88351510
          :relative 1.332717296816642
        )
        :calibrates (3827821 4385649)
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
          :absolute 85445088
          :relative 1.2969869472441036
        )
        :calibrates (4333511 4290914)
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
          :absolute 86893180
          :relative 1.2180520077488801
        )
        :calibrates (4431297 6087442)
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
          :absolute 87908707
          :relative 1.3163562504821849
        )
        :calibrates (4492933 3993118)
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
          :absolute 91002689
          :relative 1.3276064989434053
        )
        :calibrates (4226787 4333291)
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
          :absolute 90492709
          :relative 1.24490183140537
        )
        :calibrates (6257955 4039781)
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
          :absolute 85863634
          :relative 1.3191868905656896
        )
        :calibrates (3906190 4328597)
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
          :absolute 85157030
          :relative 1.2939108275573954
        )
        :calibrates (4256060 4400387)
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
          :absolute 87868252
          :relative 1.3138224870296797
        )
        :calibrates (4239149 4292628)
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
          :absolute 87095490
          :relative 1.329242906717311
        )
        :calibrates (4270656 3891084)
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
          :absolute 85925844
          :relative 1.2990985729518987
        )
        :calibrates (4275527 4355356)
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
          :absolute 89143042
          :relative 1.31857899852115
        )
        :calibrates (4241680 4319595)
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
          :absolute 85357042
          :relative 1.312864981248423
        )
        :calibrates (4001684 4304554)
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
          :absolute 86534551
          :relative 1.3134319102717964
        )
        :calibrates (4481440 3928398)
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
          :absolute 91225824
          :relative 1.3285418803735687
        )
        :calibrates (4240267 4322338)
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
          :absolute 85666197
          :relative 1.2930557304880392
        )
        :calibrates (4246068 4479300)
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
          :absolute 88219106
          :relative 1.3257665632681759
        )
        :calibrates (4230932 4102542)
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
          :absolute 87254877
          :relative 1.3019338043835973
        )
        :calibrates (4244078 4463270)
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
          :absolute 87507051
          :relative 1.2788183650378935
        )
        :calibrates (4318428 4891467)
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
          :absolute 89258872
          :relative 1.330083758780089
        )
        :calibrates (4230971 4117321)
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
          :absolute 93752471
          :relative 1.3393624239132826
        )
        :calibrates (4297486 4285735)
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
          :absolute 86349021
          :relative 1.3531583277825054
        )
        :calibrates (3839432 3818810)
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
          :absolute 98845371
          :relative 1.2953092298895545
        )
        :calibrates (3989263 6026340)
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
          :absolute 86443323
          :relative 1.3037662629197264
        )
        :calibrates (4239052 4350988)
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
          :absolute 87039961
          :relative 1.318521055429192
        )
        :calibrates (4051664 4308747)
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
          :absolute 91010693
          :relative 1.210061827783887
        )
        :calibrates (6901295 4320455)
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
          :absolute 91491964
          :relative 1.2457786728539146
        )
        :calibrates (4171410 6219038)
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
          :absolute 87508361
          :relative 1.3111774366829847
        )
        :calibrates (4254638 4294102)
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
          :absolute 89556936
          :relative 1.313652602583116
        )
        :calibrates (4791688 3907458)
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
          :absolute 91105748
          :relative 1.2486481884752305
        )
        :calibrates (5910793 4367656)
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
          :absolute 89864762
          :relative 1.319309197347105
        )
        :calibrates (4303658 4312432)
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
          :absolute 86615609
          :relative 1.3075787735096696
        )
        :calibrates (4194293 4337639)
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
          :absolute 87796046
          :relative 1.3104653793085075
        )
        :calibrates (4277756 4313162)
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
          :absolute 87587297
          :relative 1.3324192464685731
        )
        :calibrates (3818345 4329671)
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
          :absolute 91005930
          :relative 1.3472484930720323
        )
        :calibrates (4242295 3939549)
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
          :absolute 86059966
          :relative 1.3046311513881075
        )
        :calibrates (4249307 4285624)
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
          :absolute 88999272
          :relative 1.3173501457124688
        )
        :calibrates (4242777 4328910)
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
          :absolute 86515847
          :relative 1.344056893870588
        )
        :calibrates (3812119 4023418)
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
          :absolute 84315937
          :relative 1.3058926724482107
        )
        :calibrates (4028901 4308813)
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
          :absolute 91099147
          :relative 1.3275778258323203
        )
        :calibrates (4262283 4307434)
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
          :absolute 84536246
          :relative 1.3197983775239837
        )
        :calibrates (3788809 4307267)
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
          :absolute 93928178
          :relative 1.247405037361802
        )
        :calibrates (4244138 6383111)
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
          :absolute 90085112
          :relative 1.3098452922558181
        )
        :calibrates (4450336 4377164)
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
          :absolute 88369886
          :relative 1.3133083155748295
        )
        :calibrates (4242813 4347836)
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
          :absolute 85542063
          :relative 1.1144793565739834
        )
        :calibrates (7027482 6116603)
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
          :absolute 89188866
          :relative 1.3153977341578995
        )
        :calibrates (4313283 4315368)
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
          :absolute 86243495
          :relative 1.3014341205526883
        )
        :calibrates (4328767 4287561)
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
          :absolute 97061808
          :relative 1.1919544137775466
        )
        :calibrates (6028765 6448631)
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
          :absolute 87555386
          :relative 1.2244058736384225
        )
        :calibrates (4301248 6143717)
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
          :absolute 86284388
          :relative 1.2125486794685896
        )
        :calibrates (4233754 6344489)
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
          :absolute 88603182
          :relative 1.3134614347288849
        )
        :calibrates (4263229 4347063)
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
          :absolute 86742691
          :relative 1.3315100295755862
        )
        :calibrates (3784349 4302007)
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
          :absolute 88529923
          :relative 1.2226164121227925
        )
        :calibrates (6067197 4537632)
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
          :absolute 82834967
          :relative 1.2048504853797493
        )
        :calibrates (4235863 6101106)
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
          :absolute 88083108
          :relative 1.303504841877014
        )
        :calibrates (4244891 4513368)
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
          :absolute 87028638
          :relative 1.2138106415648682
        )
        :calibrates (4271885 6366643)
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
          :absolute 90600458
          :relative 1.1798444673943118
        )
        :calibrates (5860997 6115117)
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
          :absolute 87002167
          :relative 1.3071032502727713
        )
        :calibrates (4268472 4310926)
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
          :absolute 91406079
          :relative 1.1782884067774304
        )
        :calibrates (5411241 6714734)
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
          :absolute 87694302
          :relative 1.2257363005569113
        )
        :calibrates (6069329 4360209)
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
          :absolute 96550444
          :relative 1.3461384424276917
        )
        :calibrates (4388523 4314013)
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
          :absolute 90296319
          :relative 1.238923526102129
        )
        :calibrates (6085655 4332157)
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
          :absolute 88790127
          :relative 1.2968015571476947
        )
        :calibrates (4656470 4309414)
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
          :absolute 84957860
          :relative 1.2907860468876196
        )
        :calibrates (4242487 4456076)
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
          :absolute 86761465
          :relative 1.30305711276731
        )
        :calibrates (4300819 4334925)
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
          :absolute 87494017
          :relative 1.2739309669561631
        )
        :calibrates (5016795 4295943)
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
          :absolute 86086973
          :relative 1.30203499378637
        )
        :calibrates (4297903 4290896)
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
          :absolute 89413576
          :relative 1.3188130696826317
        )
        :calibrates (4258030 4324600)
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
          :absolute 93137070
          :relative 1.3367150892081343
        )
        :calibrates (4283888 4295128)
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
          :absolute 93635460
          :relative 1.3398503340116228
        )
        :calibrates (4232931 4329952)
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
          :absolute 87037588
          :relative 1.3063551619142573
        )
        :calibrates (4307393 4290295)
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
          :absolute 89186086
          :relative 1.3082528368509985
        )
        :calibrates (4459698 4311810)
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
          :absolute 93936481
          :relative 1.3181988005697567
        )
        :calibrates (4268448 4761089)
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
          :absolute 86633877
          :relative 1.292455796570126
        )
        :calibrates (4513083 4323044)
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
          :absolute 85307846
          :relative 1.191681798518815
        )
        :calibrates (4387119 6586179)
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
          :absolute 84773148
          :relative 1.291301719598021
        )
        :calibrates (4378153 4291198)
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
          :absolute 85217686
          :relative 1.2959980576794679
        )
        :calibrates (4236802 4384278)
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
          :absolute 90862202
          :relative 1.2498902075984208
        )
        :calibrates (5872017 4349681)
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
          :absolute 87976540
          :relative 1.312828091849984
        )
        :calibrates (4264782 4297091)
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
          :absolute 90177494
          :relative 1.3212487551433765
        )
        :calibrates (4279654 4327893)
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
          :absolute 92819979
          :relative 1.3357358957140861
        )
        :calibrates (4264135 4304972)
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
          :absolute 91514183
          :relative 1.3294282352742237
        )
        :calibrates (4235481 4336677)
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
          :absolute 88068685
          :relative 1.3119786886065135
        )
        :calibrates (4289434 4298186)
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
          :absolute 90295254
          :relative 1.3268030749247934
        )
        :calibrates (4220216 4289045)
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
          :absolute 87169589
          :relative 1.32097392310345
        )
        :calibrates (4268220 4057486)
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
          :absolute 87870419
          :relative 1.226496746817422
        )
        :calibrates (4347716 6084485)
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
          :absolute 89845898
          :relative 1.237133927634116
        )
        :calibrates (4255671 6152977)
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
          :absolute 84200364
          :relative 1.2942555535443894
        )
        :calibrates (4240972 4311436)
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
          :absolute 99513835
          :relative 1.3006974647659755
        )
        :calibrates (5657124 4301882)
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
          :absolute 90621895
          :relative 1.2516014263592368
        )
        :calibrates (5885316 4269258)
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
          :absolute 94982252
          :relative 1.3426918073139995
        )
        :calibrates (4265514 4363887)
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
          :absolute 98342273
          :relative 1.3616500899866637
        )
        :calibrates (4257809 4295224)
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
          :absolute 86916584
          :relative 1.307650407588356
        )
        :calibrates (4251057 4309110)
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
          :absolute 97857545
          :relative 1.3568364442576495
        )
        :calibrates (4319099 4286634)
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
          :absolute 91287873
          :relative 1.3304753677134826
        )
        :calibrates (4234565 4295802)
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
          :absolute 87339537
          :relative 1.2992699609251175
        )
        :calibrates (4263112 4506309)
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
          :absolute 85580334
          :relative 1.3017313472319683
        )
        :calibrates (4237621 4306603)
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
          :absolute 85669700
          :relative 1.2880939583164464
        )
        :calibrates (4543563 4282424)
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
          :absolute 87096178
          :relative 1.307217167531207
        )
        :calibrates (4244354 4342062)
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
          :absolute 88161900
          :relative 1.3149904958450072
        )
        :calibrates (4246246 4291052)
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
          :absolute 91555329
          :relative 1.3315916724283368
        )
        :calibrates (4240382 4293015)
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
          :absolute 84298042
          :relative 1.2949441042276548
        )
        :calibrates (4258065 4290700)
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
          :absolute 85896216
          :relative 1.3016306940013125
        )
        :calibrates (4300802 4276947)
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
          :absolute 87434452
          :relative 1.3122660609727097
        )
        :calibrates (4238669 4281467)
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
          :absolute 94760894
          :relative 1.2061164983907378
        )
        :calibrates (4257932 7532851)
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
          :absolute 85836652
          :relative 1.2959704982795266
        )
        :calibrates (4235044 4449205)
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
          :absolute 92433289
          :relative 1.3355788119347534
        )
        :calibrates (4239605 4296890)
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
          :absolute 95675373
          :relative 1.3466264518767364
        )
        :calibrates (4296636 4317341)
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
          :absolute 86453845
          :relative 1.151419415576876
        )
        :calibrates (5971760 6229225)
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
          :absolute 90578974
          :relative 1.3184628689223319
        )
        :calibrates (4280621 4420887)
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
          :absolute 85860032
          :relative 1.286487997340804
        )
        :calibrates (4258426 4619940)
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
          :absolute 91439064
          :relative 1.2425370476197697
        )
        :calibrates (5881622 4580619)
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
          :absolute 88090402
          :relative 1.262396434631154
        )
        :calibrates (4244456 5384122)
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
          :absolute 85512911
          :relative 1.299877396833837
        )
        :calibrates (4264667 4309349)
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
          :absolute 106230717
          :relative 1.3875896177831546
        )
        :calibrates (4275978 4427453)
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
          :absolute 88398556
          :relative 1.3225363056255939
        )
        :calibrates (4101127 4311640)
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
          :absolute 86950827
          :relative 1.2975172581398446
        )
        :calibrates (4470401 4295296)
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
          :absolute 84441301
          :relative 1.2937386945935945
        )
        :calibrates (4290998 4296096)
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
          :absolute 86616873
          :relative 1.3058435769716579
        )
        :calibrates (4250287 4315927)
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
          :absolute 85795310
          :relative 1.2997243990320073
        )
        :calibrates (4280296 4325066)
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
          :absolute 90843583
          :relative 1.309574904320484
        )
        :calibrates (4355409 4551958)
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
          :absolute 84422432
          :relative 1.2771976936174525
        )
        :calibrates (4629726 4288740)
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
          :absolute 83219319
          :relative 1.2884754747608576
        )
        :calibrates (4235418 4330594)
      ))
    :"jpamb.cases.Simple.checkBeforeAssert:(I)V" ((analysis-result
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
          :absolute 88572303
          :relative 1.21993543632358
        )
        :calibrates (4455187 6220418)
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
          :absolute 85940361
          :relative 1.303697345950391
        )
        :calibrates (4232033 4309382)
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
          :absolute 84161484
          :relative 1.1940700860873674
        )
        :calibrates (4687638 6078831)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN2:(I)I" ((analysis-result
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
          :absolute 92457700
          :relative 1.1587343068088978
        )
        :calibrates (6187687 6642671)
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
          :absolute 89620129
          :relative 1.2166316253226312
        )
        :calibrates (4258745 6625641)
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
          :absolute 91425224
          :relative 1.24942977261371
        )
        :calibrates (5942038 4353908)
      ))
    :"jpamb.cases.Simple.checkBeforeDivideByN:(I)I" ((analysis-result
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
          :absolute 91130737
          :relative 1.2492310549465147
        )
        :calibrates (5860866 4406613)
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
          :absolute 87664619
          :relative 1.2207818155491776
        )
        :calibrates (5852886 4692744)
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
          :absolute 87468887
          :relative 1.3110332069952737
        )
        :calibrates (4257710 4290012)
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
          :absolute 86723904
          :relative 1.215596331032771
        )
        :calibrates (4287065 6270712)
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
          :absolute 90600702
          :relative 1.3222535360555674
        )
        :calibrates (4272380 4355578)
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
          :absolute 87915966
          :relative 1.3127181583710361
        )
        :calibrates (4249816 4308328)
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
          :absolute 86739147
          :relative 1.2106047254890697
        )
        :calibrates (5895649 4786052)
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
          :absolute 91820152
          :relative 1.244922036579029
        )
        :calibrates (4232204 6216104)
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
          :absolute 93029474
          :relative 1.25018091117907
        )
        :calibrates (4254505 6204001)
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
          :absolute 86030064
          :relative 1.3044922869637119
        )
        :calibrates (4237146 4297548)
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
          :absolute 89054113
          :relative 1.1557829604085414
        )
        :calibrates (6157926 6284384)
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
          :absolute 91561964
          :relative 1.1437265818592048
        )
        :calibrates (6830665 6322144)
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
          :absolute 87149600
          :relative 1.3075171046686163
        )
        :calibrates (4264819 4320932)
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
          :absolute 102238599
          :relative 1.2089846445492674
        )
        :calibrates (6223602 6413871)
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
          :absolute 86059844
          :relative 1.2158764851319799
        )
        :calibrates (6177931 4292247)
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
          :absolute 89487779
          :relative 1.319124152827335
        )
        :calibrates (4289132 4294470)
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
          :absolute 87957618
          :relative 1.2356633299136632
        )
        :calibrates (4236126 5988328)
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
          :absolute 86240419
          :relative 1.2951538979936679
        )
        :calibrates (4425599 4315921)
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
          :absolute 85984850
          :relative 1.2943963021003482
        )
        :calibrates (4286521 4444311)
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
          :absolute 94117337
          :relative 1.3418582874089258
        )
        :calibrates (4244349 4322899)
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
          :absolute 84786653
          :relative 1.192025787416316
        )
        :calibrates (4233929 6663692)
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
          :absolute 88634085
          :relative 1.2565209983631302
        )
        :calibrates (4264772 5555189)
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
          :absolute 96826251
          :relative 1.2639217971423713
        )
        :calibrates (4256707 6289622)
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
          :absolute 87853640
          :relative 1.2263446257976598
        )
        :calibrates (6044576 4389287)
      ))
    :"jpamb.cases.Simple.guardedDivision:(I)I" ((analysis-result
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
          :absolute 86026501
          :relative 1.2155564852340137
        )
        :calibrates (4255287 6218549)
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
          :absolute 94210559
          :relative 1.2414796043315393
        )
        :calibrates (6639312 4166315)
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
          :absolute 86855674
          :relative 1.3003984516305065
        )
        :calibrates (4390532 4307675)
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
          :absolute 90774859
          :relative 1.2391039857757378
        )
        :calibrates (5923565 4545107)
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
          :absolute 86770673
          :relative 1.319796920674687
        )
        :calibrates (3812659 4497437)
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
          :absolute 90041800
          :relative 1.3200343651051516
        )
        :calibrates (4263525 4355136)
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
          :absolute 89748927
          :relative 1.3368525035491368
        )
        :calibrates (3940689 4323624)
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
          :absolute 95108521
          :relative 1.3347475543104048
        )
        :calibrates (4358599 4441790)
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
          :absolute 95783291
          :relative 1.3482652639351536
        )
        :calibrates (4264811 4326402)
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
          :absolute 93035123
          :relative 1.316750347826045
        )
        :calibrates (4522206 4450565)
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
          :absolute 88312465
          :relative 1.2846937495321693
        )
        :calibrates (4277110 4892656)
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
          :absolute 90465676
          :relative 1.2162306387799067
        )
        :calibrates (4272472 6724755)
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
          :absolute 91535576
          :relative 1.315032403035801
        )
        :calibrates (4459868 4403270)
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
          :absolute 91153229
          :relative 1.3216413664245557
        )
        :calibrates (4242410 4450410)
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
          :absolute 88852393
          :relative 1.303018472806904
        )
        :calibrates (4336021 4508629)
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
          :absolute 84367896
          :relative 1.2965238305983307
        )
        :calibrates (4245020 4279764)
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
          :absolute 88304710
          :relative 1.3130232283584933
        )
        :calibrates (4298178 4291772)
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
          :absolute 93379365
          :relative 1.2291252497882768
        )
        :calibrates (4253573 6765769)
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
          :absolute 85351142
          :relative 1.3020015883648752
        )
        :calibrates (4230570 4285471)
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
          :absolute 90699350
          :relative 1.2940713943148414
        )
        :calibrates (4666703 4549728)
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
          :absolute 90671397
          :relative 1.1678521597807439
        )
        :calibrates (5994373 6326689)
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
          :absolute 91698421
          :relative 1.2487587231521822
        )
        :calibrates (4233564 6109117)
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
          :absolute 86872433
          :relative 1.2989982380478333
        )
        :calibrates (4458776 4269204)
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
          :absolute 89568728
          :relative 1.1639184054617595
        )
        :calibrates (6116912 6165057)
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
          :absolute 88645273
          :relative 1.2307000481835546
        )
        :calibrates (6005848 4416979)
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
          :absolute 89556197
          :relative 1.2995231716343143
        )
        :calibrates (4655629 4331117)
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
          :absolute 92458915
          :relative 1.318470855516387
        )
        :calibrates (4535096 4346846)
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
          :absolute 88082472
          :relative 1.3056787601232687
        )
        :calibrates (4241204 4473261)
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
          :absolute 93824414
          :relative 1.3539278914416153
        )
        :calibrates (4297557 4008941)
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
          :absolute 91057672
          :relative 1.3226682980684326
        )
        :calibrates (4473075 4190123)
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
          :absolute 91718273
          :relative 1.3162333486487936
        )
        :calibrates (4393132 4463172)
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
          :absolute 90344020
          :relative 1.3332190572337954
        )
        :calibrates (4058042 4330961)
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
          :absolute 88240668
          :relative 1.3269406366056713
        )
        :calibrates (4326025 3986982)
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
          :absolute 85499654
          :relative 1.2015754656986846
        )
        :calibrates (4278334 6471924)
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
          :absolute 90070969
          :relative 1.3096242242488512
        )
        :calibrates (4492947 4337661)
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
          :absolute 87220649
          :relative 1.3292831145651374
        )
        :calibrates (3890060 4282652)
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
          :absolute 87075735
          :relative 1.307911357608946
        )
        :calibrates (4273812 4296878)
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
          :absolute 107019928
          :relative 1.3880427516674223
        )
        :calibrates (4472853 4286094)
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
          :absolute 87852681
          :relative 1.3068939205758363
        )
        :calibrates (4290139 4377306)
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
          :absolute 92635010
          :relative 1.3280000044856066
        )
        :calibrates (4427596 4278133)
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
          :absolute 87477382
          :relative 1.3099509813522452
        )
        :calibrates (4285207 4284674)
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
          :absolute 87561735
          :relative 1.325374707303506
        )
        :calibrates (3980831 4298012)
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
          :absolute 85944257
          :relative 1.299604084290003
        )
        :calibrates (4316179 4306511)
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
          :absolute 95278306
          :relative 1.346459955511207
        )
        :calibrates (4263999 4317518)
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
          :absolute 85585636
          :relative 1.2949463280866875
        )
        :calibrates (4354453 4324844)
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
          :absolute 89382952
          :relative 1.313013904342668
        )
        :calibrates (4385972 4309052)
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
          :absolute 86199675
          :relative 1.295767201891157
        )
        :calibrates (4443512 4281548)
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
          :absolute 92554891
          :relative 1.332085523716332
        )
        :calibrates (4273084 4343673)
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
          :absolute 87656642
          :relative 1.3104316690553854
        )
        :calibrates (4264383 4313560)
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
          :absolute 94010059
          :relative 1.3438278359565197
        )
        :calibrates (4223592 4295170)
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
          :absolute 87207981
          :relative 1.2154875158268788
        )
        :calibrates (4488516 6130853)
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
          :absolute 90882568
          :relative 1.3269108127637215
        )
        :calibrates (4273077 4289407)
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
          :absolute 85989566
          :relative 1.2955881050707334
        )
        :calibrates (4423710 4283673)
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
          :absolute 88446969
          :relative 1.2117076431232026
        )
        :calibrates (6526524 4337865)
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
          :absolute 83303086
          :relative 1.287683766120033
        )
        :calibrates (4271633 4318647)
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
          :absolute 86996688
          :relative 1.3088132782942796
        )
        :calibrates (4243579 4301566)
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
          :absolute 88674831
          :relative 1.2812433135086567
        )
        :calibrates (4267542 5013293)
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
          :absolute 85566716
          :relative 1.2803893999034486
        )
        :calibrates (4668110 4305051)
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
          :absolute 98165132
          :relative 1.3625143713617691
        )
        :calibrates (4234396 4286257)
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
          :absolute 86834529
          :relative 1.3288310400653172
        )
        :calibrates (3789624 4355382)
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
          :absolute 88674200
          :relative 1.3128681646253717
        )
        :calibrates (4305852 4323121)
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
          :absolute 94094025
          :relative 1.3407321700280015
        )
        :calibrates (4243306 4344058)
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
          :absolute 85735419
          :relative 1.305718474374605
        )
        :calibrates (4189589 4291894)
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
          :absolute 86031496
          :relative 1.3045140694588178
        )
        :calibrates (4247781 4286627)
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
          :absolute 97149374
          :relative 1.3548067543930784
        )
        :calibrates (4264431 4319046)
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
          :absolute 85828613
          :relative 1.3032700804332817
        )
        :calibrates (4232251 4306454)
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
          :absolute 85521972
          :relative 1.3004114692426807
        )
        :calibrates (4242485 4321901)
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
          :absolute 90459409
          :relative 1.3199424305073457
        )
        :calibrates (4371767 4288700)
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
          :absolute 89569598
          :relative 1.315628248386051
        )
        :calibrates (4300315 4360572)
      ))
  )
)