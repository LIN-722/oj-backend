package com.lin.oj.judge;

import com.lin.oj.judge.codesandbox.model.JudgeInfo;
import com.lin.oj.judge.strategy.DefaultJudgeStrategy;
import com.lin.oj.judge.strategy.JavaLanguageJudgeStrategy;
import com.lin.oj.judge.strategy.JudgeContext;
import com.lin.oj.judge.strategy.JudgeStrategy;
import com.lin.oj.model.entity.QuestionSubmit;
import org.springframework.stereotype.Service;

/**
 * 判题管理（简化调用）
 */
@Service
public class JudgeManager {

    /**
     * 执行判题
     *
     * @param judgeContext
     * @return
     */
    JudgeInfo doJudge(JudgeContext judgeContext) {
        QuestionSubmit questionSubmit = judgeContext.getQuestionSubmit();
        String language = questionSubmit.getLanguage();
        JudgeStrategy judgeStrategy = new DefaultJudgeStrategy();
        if ("java".equals(language)) {
            judgeStrategy = new JavaLanguageJudgeStrategy();
        }
        return judgeStrategy.doJudge(judgeContext);
    }

}
