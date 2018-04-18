package com.ppcxy.flow.designer.api;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.apache.commons.lang3.StringUtils;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.common.api.FlowableException;
import org.flowable.engine.repository.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springside.modules.utils.io.IOUtil;

import java.io.IOException;

//@RestController
public class FlowDesignerController implements ModelDataJsonConstants {
    
    protected static final Logger LOGGER = LoggerFactory.getLogger(FlowDesignerController.class);
    
    @Autowired
    private RepositoryService repositoryService;
    private ObjectMapper objectMapper = new ObjectMapper();
    
    @RequestMapping("/app/rest/account")
    public String auth() {
        return "{\"fullname\":\"admin\"}";
    }
    
    @RequestMapping("/app/rest/models/{modelId}/editor/json")
    public String editorScheam(@PathVariable(value = "modelId") String modelId) {
        ObjectNode modelNode = null;
        
        Model model = repositoryService.getModel(modelId);
        
        if (model != null) {
            try {
                if (StringUtils.isNotEmpty(model.getMetaInfo())) {
                    modelNode = (ObjectNode) objectMapper.readTree(model.getMetaInfo());
                } else {
                    modelNode = objectMapper.createObjectNode();
                    modelNode.put(MODEL_NAME, model.getName());
                }
                modelNode.put(MODEL_ID, model.getId());
                ObjectNode editorJsonNode = (ObjectNode) objectMapper.readTree(
                        new String(repositoryService.getModelEditorSource(model.getId()), "utf-8"));
                JsonNode properties = editorJsonNode.get("properties");
                
                //TODO 进入流程绘制的时候把模型key和name带过去
                if (properties == null) {
                    ObjectNode objectNode = objectMapper.createObjectNode();
                    objectNode.put("process_id", model.getKey());
                    objectNode.put("name", model.getName());
                    editorJsonNode.put("properties", objectNode);
                }
                modelNode.put("model", editorJsonNode);
                
            } catch (Exception e) {
                LOGGER.error("Error creating model JSON", e);
                throw new FlowableException("Error creating model JSON", e);
            }
        }
        //需要先创建一个model 才可以编辑
        //return modelNode.toString();
        
        return "{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"name\":\"员工考勤流程\",\"revision\":1,\"description\":\"\",\"modelId\":\"2906368\",\"model\":{\"resourceId\":\"2906368\",\"properties\":{\"process_id\":\"pygkqlc\",\"name\":\"员工考勤流程\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-BDCD5EFF-18D6-4DD7-AF1E-F6DDB2D15E7D\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A2781102-7BB8-4244-8232-17B2D980F62A\"}],\"bounds\":{\"lowerRight\":{\"x\":232,\"y\":107},\"upperLeft\":{\"x\":202,\"y\":77}},\"dockers\":[]},{\"resourceId\":\"sid-BB5822F5-AE03-43D8-B47B-7E21986F5955\",\"properties\":{\"overrideid\":\"\",\"name\":\"创建\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"常用语:流程发起人:;\"}},\"formkeydefinition\":\"26201406-ccf2-4127-af3e-92b1f7392bea\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-75C6E32A-91F7-4242-B0D9-068E4941CC9E\"}],\"bounds\":{\"lowerRight\":{\"x\":377,\"y\":132},\"upperLeft\":{\"x\":277,\"y\":52}},\"dockers\":[]},{\"resourceId\":\"sid-A2781102-7BB8-4244-8232-17B2D980F62A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BB5822F5-AE03-43D8-B47B-7E21986F5955\"}],\"bounds\":{\"lowerRight\":{\"x\":276.15625,\"y\":92},\"upperLeft\":{\"x\":232.609375,\"y\":92}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-BB5822F5-AE03-43D8-B47B-7E21986F5955\"}},{\"resourceId\":\"sid-8C8AB764-7B58-41AA-96F1-B3CB83E9C2B1\",\"properties\":{\"overrideid\":\"\",\"name\":\"部门负责人\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"常用语:流程发起人:部门主管:;\"}},\"formkeydefinition\":\"26201406-ccf2-4127-af3e-92b1f7392bea\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-AE7669A8-36B2-4331-8161-88A2DFBFD4E4\"}],\"bounds\":{\"lowerRight\":{\"x\":522,\"y\":132},\"upperLeft\":{\"x\":422,\"y\":52}},\"dockers\":[]},{\"resourceId\":\"sid-75C6E32A-91F7-4242-B0D9-068E4941CC9E\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8C8AB764-7B58-41AA-96F1-B3CB83E9C2B1\"}],\"bounds\":{\"lowerRight\":{\"x\":421.15625,\"y\":92},\"upperLeft\":{\"x\":377.84375,\"y\":92}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-8C8AB764-7B58-41AA-96F1-B3CB83E9C2B1\"}},{\"resourceId\":\"sid-84A927D7-F69D-4A7F-839C-2D9383F71E62\",\"properties\":{\"overrideid\":\"\",\"name\":\"社保管理员\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"常用语:工作职务:社保管理员\"}},\"formkeydefinition\":\"26201406-ccf2-4127-af3e-92b1f7392bea\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6BA501E8-A6F5-4619-BA94-E6AE161955E5\"}],\"bounds\":{\"lowerRight\":{\"x\":667,\"y\":132},\"upperLeft\":{\"x\":567,\"y\":52}},\"dockers\":[]},{\"resourceId\":\"sid-AE7669A8-36B2-4331-8161-88A2DFBFD4E4\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-84A927D7-F69D-4A7F-839C-2D9383F71E62\"}],\"bounds\":{\"lowerRight\":{\"x\":566.15625,\"y\":92},\"upperLeft\":{\"x\":522.84375,\"y\":92}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-84A927D7-F69D-4A7F-839C-2D9383F71E62\"}},{\"resourceId\":\"sid-C1CBBDA6-45CD-469F-9CF3-AC86B690943A\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":740,\"y\":106},\"upperLeft\":{\"x\":712,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-6BA501E8-A6F5-4619-BA94-E6AE161955E5\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C1CBBDA6-45CD-469F-9CF3-AC86B690943A\"}],\"bounds\":{\"lowerRight\":{\"x\":711.375,\"y\":92},\"upperLeft\":{\"x\":667.390625,\"y\":92}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-C1CBBDA6-45CD-469F-9CF3-AC86B690943A\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}}";
    }
    
    @RequestMapping(value = "/model/{modelId}/save", method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.OK)
    public void saveModel(@PathVariable String modelId, @RequestBody MultiValueMap<String, String> values) {
        try {
            
            Model model = repositoryService.getModel(modelId);
            
            ObjectNode modelJson = (ObjectNode) objectMapper.readTree(model.getMetaInfo());
            
            modelJson.put(MODEL_NAME, values.getFirst("name"));
            modelJson.put(MODEL_DESCRIPTION, values.getFirst("description"));
            model.setMetaInfo(modelJson.toString());
            model.setName(values.getFirst("name"));
            
            repositoryService.saveModel(model);
            
            repositoryService.addModelEditorSource(model.getId(), values.getFirst("json_xml").getBytes("utf-8"));
        } catch (Exception e) {
            LOGGER.error("Error saving model", e);
        }
    }
    
    @RequestMapping("/app/rest/stencil-sets/editor")
    public String editorScheam() {
        
        Resource resource1 = new FileSystemResourceLoader().getResource("classpath:flow/stencilset_bpmn_zh.json");
        
        String schema = null;
        try {
            schema = IOUtil.toString(resource1.getInputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return schema;
    }
    
}
